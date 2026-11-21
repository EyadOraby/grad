import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Where SANAD saves its data. SharedPreferences in the app, memory in tests.
abstract class SanadStorage {
  String? read();
  Future<void> write(String value);
}

class MemorySanadStorage implements SanadStorage {
  String? value;
  @override
  String? read() => value;
  @override
  Future<void> write(String v) async => value = v;
}

enum AppointmentStatus { booked, completed, cancelled }

enum RequestStatus { submitted, underReview, approved, readyForPickup, rejected }

enum ApplicationStatus { applied, shortlisted, interview, rejected }

extension RequestStatusX on RequestStatus {
  String get label => switch (this) {
        RequestStatus.submitted => 'Submitted',
        RequestStatus.underReview => 'Under review',
        RequestStatus.approved => 'Approved',
        RequestStatus.readyForPickup => 'Ready for pickup',
        RequestStatus.rejected => 'Rejected',
      };

  RequestStatus? get next => switch (this) {
        RequestStatus.submitted => RequestStatus.underReview,
        RequestStatus.underReview => RequestStatus.approved,
        RequestStatus.approved => RequestStatus.readyForPickup,
        _ => null,
      };
}

extension ApplicationStatusX on ApplicationStatus {
  String get label => switch (this) {
        ApplicationStatus.applied => 'Applied',
        ApplicationStatus.shortlisted => 'Shortlisted',
        ApplicationStatus.interview => 'Interview',
        ApplicationStatus.rejected => 'Not selected',
      };

  ApplicationStatus? get next => switch (this) {
        ApplicationStatus.applied => ApplicationStatus.shortlisted,
        ApplicationStatus.shortlisted => ApplicationStatus.interview,
        _ => null,
      };
}

class Appointment {
  final String id;
  final String citizen;
  final String provider;
  final String kind;
  final DateTime when;
  final AppointmentStatus status;

  const Appointment({
    required this.id,
    required this.citizen,
    required this.provider,
    required this.kind,
    required this.when,
    this.status = AppointmentStatus.booked,
  });

  Appointment copyWith(AppointmentStatus status) =>
      Appointment(id: id, citizen: citizen, provider: provider, kind: kind, when: when, status: status);

  Map<String, dynamic> toJson() =>
      {'id': id, 'citizen': citizen, 'provider': provider, 'kind': kind, 'when': when.toIso8601String(), 'status': status.name};

  factory Appointment.fromJson(Map j) => Appointment(
        id: j['id'] as String,
        citizen: j['citizen'] as String,
        provider: j['provider'] as String,
        kind: j['kind'] as String,
        when: DateTime.parse(j['when'] as String),
        status: AppointmentStatus.values.byName(j['status'] as String),
      );
}

class ServiceRequest {
  final String reference;
  final String citizen;
  final String service;
  final String details;
  final DateTime createdAt;
  final RequestStatus status;

  const ServiceRequest({
    required this.reference,
    required this.citizen,
    required this.service,
    required this.details,
    required this.createdAt,
    this.status = RequestStatus.submitted,
  });

  ServiceRequest copyWith(RequestStatus status) => ServiceRequest(
      reference: reference, citizen: citizen, service: service, details: details, createdAt: createdAt, status: status);

  Map<String, dynamic> toJson() => {
        'reference': reference,
        'citizen': citizen,
        'service': service,
        'details': details,
        'createdAt': createdAt.toIso8601String(),
        'status': status.name,
      };

  factory ServiceRequest.fromJson(Map j) => ServiceRequest(
        reference: j['reference'] as String,
        citizen: j['citizen'] as String,
        service: j['service'] as String,
        details: j['details'] as String,
        createdAt: DateTime.parse(j['createdAt'] as String),
        status: RequestStatus.values.byName(j['status'] as String),
      );
}

class JobApplication {
  final String id;
  final String citizen;
  final String jobTitle;
  final String company;
  final ApplicationStatus status;

  const JobApplication({
    required this.id,
    required this.citizen,
    required this.jobTitle,
    required this.company,
    this.status = ApplicationStatus.applied,
  });

  JobApplication copyWith(ApplicationStatus status) =>
      JobApplication(id: id, citizen: citizen, jobTitle: jobTitle, company: company, status: status);

  Map<String, dynamic> toJson() =>
      {'id': id, 'citizen': citizen, 'jobTitle': jobTitle, 'company': company, 'status': status.name};

  factory JobApplication.fromJson(Map j) => JobApplication(
        id: j['id'] as String,
        citizen: j['citizen'] as String,
        jobTitle: j['jobTitle'] as String,
        company: j['company'] as String,
        status: ApplicationStatus.values.byName(j['status'] as String),
      );
}

/// Accessibility preferences applied across the whole app.
class AccessibilitySettings {
  final double textScale;
  final bool highContrast;
  final bool reduceMotion;
  final bool boldText;

  const AccessibilitySettings({this.textScale = 1, this.highContrast = false, this.reduceMotion = false, this.boldText = false});

  AccessibilitySettings copyWith({double? textScale, bool? highContrast, bool? reduceMotion, bool? boldText}) =>
      AccessibilitySettings(
        textScale: textScale ?? this.textScale,
        highContrast: highContrast ?? this.highContrast,
        reduceMotion: reduceMotion ?? this.reduceMotion,
        boldText: boldText ?? this.boldText,
      );

  Map<String, dynamic> toJson() =>
      {'textScale': textScale, 'highContrast': highContrast, 'reduceMotion': reduceMotion, 'boldText': boldText};

  factory AccessibilitySettings.fromJson(Map j) => AccessibilitySettings(
        textScale: (j['textScale'] as num?)?.toDouble() ?? 1,
        highContrast: j['highContrast'] as bool? ?? false,
        reduceMotion: j['reduceMotion'] as bool? ?? false,
        boldText: j['boldText'] as bool? ?? false,
      );
}

/// The signed-in citizen in the demo.
const me = 'You';

/// Appointments, government requests, job applications and accessibility
/// settings, saved on the device. Citizens create them; staff move them on.
class SanadStore extends ChangeNotifier {
  SanadStore(this._storage, {DateTime Function()? clock}) : _clock = clock ?? DateTime.now {
    final saved = _storage.read();
    if (saved != null) {
      final j = jsonDecode(saved) as Map<String, dynamic>;
      appointments = (j['appointments'] as List).map((e) => Appointment.fromJson(e as Map)).toList();
      requests = (j['requests'] as List).map((e) => ServiceRequest.fromJson(e as Map)).toList();
      applications = (j['applications'] as List).map((e) => JobApplication.fromJson(e as Map)).toList();
      settings = AccessibilitySettings.fromJson(j['settings'] as Map? ?? const {});
    } else {
      _seed();
    }
  }

  final SanadStorage _storage;
  final DateTime Function() _clock;

  List<Appointment> appointments = [];
  List<ServiceRequest> requests = [];
  List<JobApplication> applications = [];
  AccessibilitySettings settings = const AccessibilitySettings();

  int _counter = 0;
  String _id(String prefix) => '$prefix-${(_clock().millisecondsSinceEpoch % 1000000).toString().padLeft(6, '0')}${_counter++}';

  void _save() {
    notifyListeners();
    _storage.write(jsonEncode({
      'appointments': appointments.map((e) => e.toJson()).toList(),
      'requests': requests.map((e) => e.toJson()).toList(),
      'applications': applications.map((e) => e.toJson()).toList(),
      'settings': settings.toJson(),
    }));
  }

  List<Appointment> get myAppointments =>
      appointments.where((a) => a.citizen == me).toList()..sort((a, b) => a.when.compareTo(b.when));
  List<ServiceRequest> get myRequests =>
      requests.where((r) => r.citizen == me).toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  List<JobApplication> get myApplications => applications.where((a) => a.citizen == me).toList();

  bool hasApplied(String jobTitle, String company) =>
      applications.any((a) => a.citizen == me && a.jobTitle == jobTitle && a.company == company);

  /// Books a slot. Returns null if the provider is already booked at that time.
  Appointment? book({required String provider, required String kind, required DateTime when}) {
    final taken = appointments.any((a) => a.provider == provider && a.when == when && a.status == AppointmentStatus.booked);
    if (taken || when.isBefore(_clock())) return null;
    final a = Appointment(id: _id('APT'), citizen: me, provider: provider, kind: kind, when: when);
    appointments = [...appointments, a];
    _save();
    return a;
  }

  void cancelAppointment(String id) => _setAppointment(id, AppointmentStatus.cancelled);
  void completeAppointment(String id) => _setAppointment(id, AppointmentStatus.completed);

  void _setAppointment(String id, AppointmentStatus status) {
    appointments = [for (final a in appointments) a.id == id ? a.copyWith(status) : a];
    _save();
  }

  ServiceRequest submitRequest({required String service, String details = ''}) {
    final r = ServiceRequest(reference: _id('SND'), citizen: me, service: service, details: details, createdAt: _clock());
    requests = [r, ...requests];
    _save();
    return r;
  }

  bool advanceRequest(String reference) {
    final r = requests.where((x) => x.reference == reference).firstOrNull;
    final next = r?.status.next;
    if (r == null || next == null) return false;
    requests = [for (final x in requests) x.reference == reference ? x.copyWith(next) : x];
    _save();
    return true;
  }

  bool rejectRequest(String reference) {
    final r = requests.where((x) => x.reference == reference).firstOrNull;
    if (r == null || r.status == RequestStatus.readyForPickup || r.status == RequestStatus.rejected) return false;
    requests = [for (final x in requests) x.reference == reference ? x.copyWith(RequestStatus.rejected) : x];
    _save();
    return true;
  }

  /// Applies once per job.
  JobApplication? apply({required String jobTitle, required String company}) {
    if (hasApplied(jobTitle, company)) return null;
    final a = JobApplication(id: _id('JOB'), citizen: me, jobTitle: jobTitle, company: company);
    applications = [...applications, a];
    _save();
    return a;
  }

  void advanceApplication(String id) {
    applications = [
      for (final a in applications)
        if (a.id == id && a.status.next != null) a.copyWith(a.status.next!) else a,
    ];
    _save();
  }

  void rejectApplication(String id) {
    applications = [for (final a in applications) a.id == id ? a.copyWith(ApplicationStatus.rejected) : a];
    _save();
  }

  void updateSettings(AccessibilitySettings s) {
    settings = s;
    _save();
  }

  /// Requests and bookings from other citizens, so the staff portal has work in it.
  void _seed() {
    final now = _clock();
    const citizens = ['Aly Hassan', 'Mona Adel', 'Hana Mostafa', 'Karim Fathy', 'Salma Nabil'];
    const services = ['National ID renewal', 'Integrated services card', 'Disability certificate', 'Parking permit'];
    for (var i = 0; i < 7; i++) {
      requests.add(ServiceRequest(
        reference: 'SND-10${40 + i}',
        citizen: citizens[i % citizens.length],
        service: services[i % services.length],
        details: 'Submitted online',
        createdAt: now.subtract(Duration(hours: 5 + i * 9)),
        status: RequestStatus.values[i % 4],
      ));
    }
    for (var i = 0; i < 5; i++) {
      appointments.add(Appointment(
        id: 'APT-90$i',
        citizen: citizens[i],
        provider: ['Dr. Mohamed Abdallah', 'Dar El-Fouad', 'Dr. Hana Mohamed', 'Cleopatra', 'Dr. Hassan Omar'][i],
        kind: i.isEven ? 'Doctor' : 'Hospital',
        when: DateTime(now.year, now.month, now.day, 10 + i * 2).add(Duration(days: i % 3)),
      ));
    }
    for (var i = 0; i < 4; i++) {
      applications.add(JobApplication(
        id: 'JOB-70$i',
        citizen: citizens[i + 1],
        jobTitle: ['Content Writer', 'Data Entry', 'Customer Support', 'Graphic Designer'][i],
        company: ['ON', 'Orange', 'Vodafone', 'Valu'][i],
        status: ApplicationStatus.values[i % 3],
      ));
    }
  }
}

/// The app-wide store, created in main.
late SanadStore sanadStore;
