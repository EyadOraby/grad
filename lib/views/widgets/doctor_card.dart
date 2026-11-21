import 'package:flutter/material.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

class DoctorCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String specialization;
  final String location;
  final String workinDays;
  final String workingHours;
  final String rating;
  final String? gender;
  final VoidCallback click;

  const DoctorCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.specialization,
    required this.location,
    required this.workinDays,
    required this.workingHours,
    required this.rating,
    required this.click,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderCard(
      image: gender == 'Female' ? 'assets/female-doctor-icon.png' : 'assets/doctor-icon.png',
      title: 'Dr. $firstName $lastName',
      subtitle: specialization,
      location: location,
      days: workinDays,
      hours: workingHours,
      rating: rating,
      onBook: () => showBookingSheet(context, provider: 'Dr. $firstName $lastName', kind: 'Doctor'),
    );
  }
}
