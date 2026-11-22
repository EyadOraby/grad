import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/views/pages/activity_page.dart';
import 'package:grad/views/pages/staff/staff_portal.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:material_ui/material_ui.dart';

DateTime tomorrowAt(int hour) {
  final d = DateUtils.dateOnly(DateTime.now()).add(const Duration(days: 1));
  return DateTime(d.year, d.month, d.day, hour);
}

Future<void> openSheet(WidgetTester tester) async {
  tester.view.physicalSize = const Size(900, 1800);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () =>
                showBookingSheet(context, provider: 'Dr. Test', kind: 'Doctor'),
            child: const Text('Open'),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

FilledButton confirmButton(WidgetTester tester) =>
    tester.widget<FilledButton>(find.ancestor(
      of: find.textContaining(RegExp('Choose a time|Confirm booking')),
      matching: find.byType(FilledButton),
    ));

Future<void> openPortal(WidgetTester tester, String tab) async {
  tester.view.physicalSize = const Size(390, 2400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const MaterialApp(home: StaffPortal()));
  await tester.tap(find.descendant(
      of: find.byType(NavigationBar), matching: find.text(tab)));
  await tester.pumpAndSettle();
}

int requestsIn(RequestStatus s) =>
    sanadStore.requests.where((r) => r.status == s).length;

void main() {
  // Load the app's real fonts so layout matches the app.
  setUpAll(() async {
    Future<ByteData> load(String path) =>
        File(path).readAsBytes().then((b) => ByteData.sublistView(b));
    await (FontLoader('Atkinson')
          ..addFont(load('assets/fonts/AtkinsonHyperlegible-Regular.ttf'))
          ..addFont(load('assets/fonts/AtkinsonHyperlegible-Bold.ttf')))
        .load();
  });
  setUp(() => sanadStore = SanadStore(MemorySanadStorage()));
  largeTextTests();

  test('slots read as a day and a 12-hour time', () {
    expect(formatSlot(DateTime(2026, 11, 23, 9)), 'Mon 23/11 · 9:00 AM');
    expect(formatSlot(DateTime(2026, 11, 23, 13)), 'Mon 23/11 · 1:00 PM');
    expect(formatSlot(DateTime(2026, 11, 22, 12)), 'Sun 22/11 · 12:00 PM');
    expect(formatSlot(DateTime(2026, 11, 22, 0)), 'Sun 22/11 · 12:00 AM');
  });

  testWidgets('picking a time books it and says so', (tester) async {
    await openSheet(tester);
    expect(find.text('Book with Dr. Test'), findsOneWidget);
    expect(confirmButton(tester).onPressed, isNull);

    await tester.tap(find.text('9:00 AM'));
    await tester.pump();
    expect(find.text('Confirm booking'), findsOneWidget);
    await tester.tap(find.text('Confirm booking'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Booked for'), findsOneWidget);
    final booked =
        sanadStore.appointments.where((a) => a.provider == 'Dr. Test');
    expect(booked.single.when, tomorrowAt(9));
  });

  testWidgets('a taken slot cannot be picked', (tester) async {
    sanadStore.book(provider: 'Dr. Test', kind: 'Doctor', when: tomorrowAt(9));
    await openSheet(tester);

    await tester.tap(find.text('9:00 AM'));
    await tester.pump();
    expect(confirmButton(tester).onPressed, isNull);

    await tester.tap(find.text('10:00 AM'));
    await tester.pump();
    expect(confirmButton(tester).onPressed, isNotNull);
  });

  testWidgets('staff move a request forward, and confirm before rejecting',
      (tester) async {
    sanadStore.submitRequest(service: 'National ID renewal');
    await openPortal(tester, 'Requests');

    final reviewing = requestsIn(RequestStatus.underReview);
    await tester.tap(find.text('Start review').first);
    await tester.pumpAndSettle();
    expect(requestsIn(RequestStatus.underReview), reviewing + 1);

    final rejected = requestsIn(RequestStatus.rejected);
    await tester.tap(find.widgetWithText(OutlinedButton, 'Reject').first);
    await tester.pumpAndSettle();
    expect(find.text('Reject this request?'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(requestsIn(RequestStatus.rejected), rejected);

    await tester.tap(find.widgetWithText(OutlinedButton, 'Reject').first);
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Reject'));
    await tester.pumpAndSettle();
    expect(requestsIn(RequestStatus.rejected), rejected + 1);
  });

  testWidgets('staff mark an appointment as attended', (tester) async {
    sanadStore.book(provider: 'Dr. Test', kind: 'Doctor', when: tomorrowAt(11));
    await openPortal(tester, 'Appointments');

    final done = sanadStore.appointments
        .where((a) => a.status == AppointmentStatus.completed)
        .length;
    await tester.tap(find.text('Mark attended').first);
    await tester.pumpAndSettle();
    expect(
      sanadStore.appointments
          .where((a) => a.status == AppointmentStatus.completed)
          .length,
      done + 1,
    );
  });

  testWidgets('staff shortlist and decline job applications', (tester) async {
    sanadStore.apply(jobTitle: 'Data Entry', company: 'Orange');
    await openPortal(tester, 'Applications');

    int count(ApplicationStatus s) =>
        sanadStore.applications.where((a) => a.status == s).length;
    final shortlisted = count(ApplicationStatus.shortlisted);
    await tester.tap(find.text('Shortlist').first);
    await tester.pumpAndSettle();
    expect(count(ApplicationStatus.shortlisted), shortlisted + 1);

    final declined = count(ApplicationStatus.rejected);
    await tester.tap(find.text('Decline').first);
    await tester.pumpAndSettle();
    expect(count(ApplicationStatus.rejected), declined + 1);
  });
}

void largeTextTests() {
  testWidgets('a request card fits a small phone at 160% text', (tester) async {
    sanadStore = SanadStore(MemorySanadStorage());
    tester.view.physicalSize = const Size(360, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final r = sanadStore.submitRequest(service: 'National ID renewal');
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(
            size: Size(360, 900),
            textScaler: TextScaler.linear(1.6),
          ),
          child: Scaffold(
            body: SingleChildScrollView(child: RequestCard(request: r)),
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  });
}
