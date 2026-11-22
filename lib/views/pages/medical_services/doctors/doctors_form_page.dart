import 'package:material_ui/material_ui.dart';
import 'package:grad/views/pages/medical_services/provider_page.dart';

/// Kept for older links: shows the shared provider page for a sample doctor.
class DoctorsFormPage extends StatelessWidget {
  const DoctorsFormPage({super.key});

  @override
  Widget build(BuildContext context) => const ProviderPage(
        kind: 'Doctor',
        name: 'Dr. Aly Ahmed',
        subtitle: 'Osteopaths',
        about:
            'A specialist seeing patients by appointment, with step-free access to the clinic.',
        address: 'Giza, Egypt',
        workingDays: 'Sunday - Wednesday',
        workingHours: '02:00 - 07:00 PM',
      );
}
