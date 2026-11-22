import 'package:flutter/material.dart';
import 'package:grad/views/pages/gov_services/IC_services/new_IC_form_page.dart';
import 'package:grad/views/pages/gov_services/gov_service_page.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/civic_emblem.dart';

/// Integrated services card: apply for a new card or renew one, then follow
/// the request.
class ICServicesPage extends StatelessWidget {
  const ICServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GovServicePage(
      emblem: Emblem.newCard,
      title: 'Integrated services card',
      subtitle:
          'The card that gives access to disability services, transport discounts and support programmes.',
      services: const [
        'Integrated services card',
        'Integrated services card renewal'
      ],
      actions: [
        GovAction(
          emblem: Emblem.newCard,
          title: 'Apply for a new card',
          description:
              'Three short questions and a medical check-up appointment.',
          onTap: (context) => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const NewICFormPage())),
        ),
        GovAction(
          emblem: Emblem.renewCard,
          title: 'Renew my card',
          description: 'For cards that have expired or are about to.',
          onTap: (context) => submitServiceRequest(context,
              service: 'Integrated services card renewal'),
        ),
      ],
    );
  }
}
