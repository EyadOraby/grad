import 'package:grad/l10n/sanad_strings.dart';
import 'package:material_ui/material_ui.dart';
import 'package:grad/views/pages/medical_services/provider_page.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

class HospitalCard extends StatelessWidget {
  final String name;
  final String location;
  final String workinDays;
  final String workingHours;
  final String rating;

  /// Kept for older call sites; the card opens the provider page itself.
  final VoidCallback? click;

  const HospitalCard({
    super.key,
    required this.location,
    required this.name,
    required this.workinDays,
    required this.workingHours,
    required this.rating,
    this.click,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderCard(
      image: 'assets/hospital-icon.png',
      title: name,
      subtitle: context.t('Hospital'),
      location: location,
      days: workinDays,
      hours: workingHours,
      rating: rating,
      onBook: () => showBookingSheet(context, provider: name, kind: 'Hospital'),
      onOpen: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProviderPage(
                kind: 'Hospital',
                name: name,
                about:
                    'A general hospital with emergency, outpatient and rehabilitation services.',
                address: location,
                workingDays: workinDays,
                workingHours: workingHours,
              ))),
    );
  }
}
