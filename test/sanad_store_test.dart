import 'package:flutter_test/flutter_test.dart';
import 'package:grad/state/sanad_store.dart';

void main() {
  final now = DateTime(2026, 11, 21, 9);
  SanadStore fresh([MemorySanadStorage? storage]) => SanadStore(storage ?? MemorySanadStorage(), clock: () => now);

  test('seeds work from other citizens for the staff portal, none of it mine', () {
    final s = fresh();
    expect(s.requests, isNotEmpty);
    expect(s.appointments, isNotEmpty);
    expect(s.applications, isNotEmpty);
    expect(s.myRequests, isEmpty);
    expect(s.myAppointments, isEmpty);
  });

  group('appointments', () {
    test('books a free future slot and refuses double booking or the past', () {
      final s = fresh();
      final when = DateTime(2026, 11, 22, 10);
      expect(s.book(provider: 'Dr. Aly', kind: 'Doctor', when: when), isNotNull);
      expect(s.book(provider: 'Dr. Aly', kind: 'Doctor', when: when), isNull);
      expect(s.book(provider: 'Dr. Aly', kind: 'Doctor', when: DateTime(2026, 11, 20, 10)), isNull);
      expect(s.myAppointments, hasLength(1));
    });

    test('a cancelled slot can be booked again', () {
      final s = fresh();
      final when = DateTime(2026, 11, 23, 14);
      final a = s.book(provider: 'Cleopatra', kind: 'Hospital', when: when)!;
      s.cancelAppointment(a.id);
      expect(s.book(provider: 'Cleopatra', kind: 'Hospital', when: when), isNotNull);
    });
  });

  group('government requests', () {
    test('move from submitted to ready for pickup, one step at a time', () {
      final s = fresh();
      final r = s.submitRequest(service: 'National ID renewal');
      expect(r.reference, startsWith('SND-'));
      for (final expected in [RequestStatus.underReview, RequestStatus.approved, RequestStatus.readyForPickup]) {
        expect(s.advanceRequest(r.reference), isTrue);
        expect(s.myRequests.single.status, expected);
      }
      expect(s.advanceRequest(r.reference), isFalse);
      expect(s.rejectRequest(r.reference), isFalse, reason: 'finished requests stay finished');
    });

    test('can be rejected while in progress', () {
      final s = fresh();
      final r = s.submitRequest(service: 'Integrated services card');
      expect(s.rejectRequest(r.reference), isTrue);
      expect(s.advanceRequest(r.reference), isFalse);
    });

    test('get unique reference numbers', () {
      final s = fresh();
      final a = s.submitRequest(service: 'A');
      final b = s.submitRequest(service: 'B');
      expect(a.reference, isNot(b.reference));
    });
  });

  test('job applications: once per job, then shortlist and interview', () {
    final s = fresh();
    final a = s.apply(jobTitle: 'Data Entry', company: 'Orange')!;
    expect(s.apply(jobTitle: 'Data Entry', company: 'Orange'), isNull);
    expect(s.hasApplied('Data Entry', 'Orange'), isTrue);
    s.advanceApplication(a.id);
    s.advanceApplication(a.id);
    expect(s.myApplications.single.status, ApplicationStatus.interview);
  });

  test('everything, including accessibility settings, survives a restart', () {
    final storage = MemorySanadStorage();
    final s = fresh(storage);
    s.submitRequest(service: 'Parking permit');
    s.updateSettings(const AccessibilitySettings(textScale: 1.4, highContrast: true));
    final restarted = fresh(storage);
    expect(restarted.myRequests.single.service, 'Parking permit');
    expect(restarted.settings.textScale, 1.4);
    expect(restarted.settings.highContrast, isTrue);
  });

  test('language toggles between English and Arabic and is saved', () {
    final storage = MemorySanadStorage();
    final s = fresh(storage);
    expect(s.settings.language, 'en');
    s.toggleLanguage();
    expect(fresh(storage).settings.language, 'ar');
  });

  test('listeners hear about changes', () {
    final s = fresh();
    var calls = 0;
    s.addListener(() => calls++);
    s.submitRequest(service: 'X');
    expect(calls, 1);
  });

  test('resetting accessibility keeps the language', () {
    final s = fresh();
    s.updateSettings(const AccessibilitySettings(textScale: 1.4, highContrast: true, language: 'ar'));
    s.updateSettings(AccessibilitySettings(language: s.settings.language));
    expect(s.settings.textScale, 1);
    expect(s.settings.highContrast, isFalse);
    expect(s.settings.language, 'ar');
  });
}
