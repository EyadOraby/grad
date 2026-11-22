import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/provider_page.dart';

/// Kept for older links: shows the shared provider page.
class PhysioCenterFormPage extends StatelessWidget {
  const PhysioCenterFormPage(
      {super.key,
      required this.name,
      required this.about,
      required this.address,
      required this.workinDays,
      required this.workingHours});

  final String name;
  final String about;
  final String address;
  final String workinDays;
  final String workingHours;

  @override
  Widget build(BuildContext context) => ProviderPage(
        kind: 'Physiotherapy',
        name: name,
        about: about,
        address: address,
        workingDays: workinDays,
        workingHours: workingHours,
      );
}
