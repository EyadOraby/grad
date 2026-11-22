import 'package:material_ui/material_ui.dart';
import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/views/pages/gov_services/gov_service_page.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/civic_emblem.dart';

/// National ID renewal: renew in one step, then follow the request.
class IDServicesPage extends StatelessWidget {
  const IDServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GovServicePage(
      emblem: Emblem.renewCard,
      title: 'National ID renewal',
      subtitle:
          'Renew your national ID without queues. We will tell you when it is ready to collect.',
      services: const ['National ID renewal'],
      actions: [
        GovAction(
          emblem: Emblem.renewCard,
          title: 'Renew my national ID',
          description:
              'Uses the details on your current card. Takes about a minute.',
          onTap: (context) => _confirm(context),
        ),
      ],
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.t('Renew your national ID?')),
        content: Text(context.t(
            'We will send a renewal request using the details on your current card.')),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(context.t('Cancel'))),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(context.t('Send request'))),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      await submitServiceRequest(context, service: 'National ID renewal');
    }
  }
}
