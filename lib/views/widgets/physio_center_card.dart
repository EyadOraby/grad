import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/provider_page.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

/// A physiotherapy centre in the shared provider-card style.
class PhysioCenterCard extends StatelessWidget {
  const PhysioCenterCard({
    super.key,
    required this.name,
    required this.location,
    required this.workinDays,
    required this.workingHours,
    required this.rating,
    this.click,
  });

  final String name;
  final String location;
  final String workinDays;
  final String workingHours;
  final String rating;

  /// Kept for older call sites; the card opens the provider page itself.
  final VoidCallback? click;

  @override
  Widget build(BuildContext context) {
    return ProviderCard(
      image: 'assets/pyiso-icon.png',
      title: name,
      subtitle: 'Physiotherapy center',
      location: location,
      days: workinDays,
      hours: workingHours,
      rating: rating,
      onBook: () =>
          showBookingSheet(context, provider: name, kind: 'Physiotherapy'),
      onOpen: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProviderPage(
                kind: 'Physiotherapy',
                name: name,
                about:
                    'Rehabilitation and physiotherapy sessions planned around your needs.',
                address: location,
                workingDays: workinDays,
                workingHours: workingHours,
              ))),
    );
  }
}
