import 'package:flutter/material.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

class HospitalCard extends StatelessWidget {
  final String name;
  final String location;
  final String workinDays;
  final String workingHours;
  final String rating;
  final VoidCallback click;

  const HospitalCard({
    super.key,
    required this.location,
    required this.name,
    required this.workinDays,
    required this.workingHours,
    required this.rating,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderCard(
      image: 'assets/hospital-icon.png',
      title: name,
      subtitle: 'Hospital',
      location: location,
      days: workinDays,
      hours: workingHours,
      rating: rating,
      onBook: () => showBookingSheet(context, provider: name, kind: 'Hospital'),
    );
  }
}
