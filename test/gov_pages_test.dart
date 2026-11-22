import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/views/pages/activity_page.dart';
import 'package:grad/views/pages/gov_services/IC_services/ic_services_page.dart';
import 'package:grad/views/pages/gov_services/IC_services/new_ic_form_page.dart';

Future<void> pump(WidgetTester tester, Widget page) async {
  tester.view.physicalSize = const Size(1280, 1600);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(MaterialApp(home: page));
  await tester.pump();
}

void main() {
  setUp(() => sanadStore = SanadStore(MemorySanadStorage()));

  testWidgets('new card form asks for every answer, then sends the application', (tester) async {
    await pump(tester, NewICFormPage(today: DateTime(2026, 11, 22)));

    await tester.tap(find.text('Send application'));
    await tester.pump();
    expect(find.text('Please choose social status'), findsOneWidget);
    expect(find.text('Please choose date'), findsOneWidget);
    expect(find.text('Please choose time'), findsOneWidget);
    expect(sanadStore.myRequests, isEmpty);

    await tester.tap(find.text('Married'));
    await tester.tap(find.text('23')); // Monday 23 November, the next working day
    await tester.tap(find.text('10:30'));
    await tester.tap(find.text('Send application'));
    await tester.pumpAndSettle();

    expect(find.text('Request submitted'), findsOneWidget);
    final r = sanadStore.myRequests.single;
    expect(r.service, 'Integrated services card');
    expect(r.details, contains('Married'));
    expect(r.details, contains('2026-11-23 10:30'));
  });

  testWidgets('track a request finds it by reference and says when it is unknown', (tester) async {
    final ref = sanadStore.requests.first.reference;
    await pump(tester, const ICServicesPage());

    await tester.enterText(find.byType(TextField), ref.toLowerCase());
    await tester.tap(find.text('Check'));
    await tester.pump();
    expect(find.byType(RequestCard), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'SND-NOPE');
    await tester.tap(find.text('Check'));
    await tester.pump();
    expect(find.byType(RequestCard), findsNothing);
    expect(find.text('No request with that number. Check it and try again.'), findsOneWidget);
  });
}
