import 'package:material_ui/material_ui.dart';
import 'package:grad/views/pages/medical_services/provider_page.dart';
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

  /// Kept for older call sites; the card opens the provider page itself.
  final VoidCallback? click;

  const DoctorCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.specialization,
    required this.location,
    required this.workinDays,
    required this.workingHours,
    required this.rating,
    this.click,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderCard(
      image: gender == 'Female'
          ? 'assets/female-doctor-icon.png'
          : 'assets/doctor-icon.png',
      title: 'Dr. $firstName $lastName',
      subtitle: specialization,
      location: location,
      days: workinDays,
      hours: workingHours,
      rating: rating,
      onBook: () => showBookingSheet(context,
          provider: 'Dr. $firstName $lastName', kind: 'Doctor'),
      onOpen: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProviderPage(
                kind: 'Doctor',
                name: 'Dr. $firstName $lastName',
                subtitle: specialization,
                about:
                    'A specialist seeing patients by appointment, with step-free access to the clinic.',
                address: location,
                workingDays: workinDays,
                workingHours: workingHours,
              ))),
    );
  }
}
