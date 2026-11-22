import 'package:material_ui/material_ui.dart';
import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/bottom_nav_bar_widget.dart';
import 'package:grad/views/widgets/civic_emblem.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/sanad_ui.dart';
import 'package:grad/views/widgets/template.dart';

/// One page for every medical provider (doctor, hospital, radiology or
/// physiotherapy centre): who they are, where and when, and a single
/// "Book an appointment" action that opens the shared booking sheet.
class ProviderPage extends StatelessWidget {
  const ProviderPage({
    super.key,
    required this.kind,
    required this.name,
    required this.about,
    required this.address,
    required this.workingDays,
    required this.workingHours,
    this.subtitle,
  });

  /// 'Doctor', 'Hospital', 'Radiology' or 'Physiotherapy'.
  final String kind;
  final String name;
  final String? subtitle;
  final String about;
  final String address;
  final String workingDays;
  final String workingHours;

  Emblem get _emblem => switch (kind) {
        'Doctor' => Emblem.doctor,
        'Hospital' => Emblem.hospital,
        'Radiology' => Emblem.scan,
        _ => Emblem.physio,
      };

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: context.t('SANAD'),
      index: 2,
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            children: [
              SanadCard(
                child: Row(children: [
                  SizedBox(width: 76, height: 76, child: CivicEmblem(_emblem)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.t(kind).toUpperCase(),
                            style: const TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w700,
                                color: SanadColors.gold)),
                        const SizedBox(height: 4),
                        Text(name,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: SanadColors.ink,
                                height: 1.2)),
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(context.t(subtitle!),
                              style: const TextStyle(
                                  color: SanadColors.inkMuted, fontSize: 15)),
                        ],
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              _Section(
                title: context.t('About'),
                child: Text(context.t(about),
                    style: const TextStyle(
                        color: SanadColors.ink, fontSize: 15, height: 1.55)),
              ),
              _Section(
                title: context.t('Where and when'),
                child: Column(children: [
                  _Fact(
                      icon: Icons.place_outlined,
                      label: context.t('Address'),
                      value: context.t(address)),
                  _Fact(
                      icon: Icons.calendar_month_outlined,
                      label: context.t('Working days'),
                      value: context.t(workingDays)),
                  _Fact(
                      icon: Icons.schedule_rounded,
                      label: context.t('Working hours'),
                      value: context.t(workingHours)),
                ]),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 54,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: SanadColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    textStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () =>
                      showBookingSheet(context, provider: name, kind: kind),
                  icon: const Icon(Icons.event_available_rounded),
                  label: Text(context.t('Book an appointment')),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                context.t(
                    'Pick a day and time; taken slots are blocked, and you can cancel from Activity.'),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: SanadColors.inkMuted, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      bottomNavBar: BottomNavBar(index: 2),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SanadCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: SanadColors.ink)),
              const SizedBox(height: 10),
              child,
            ],
          ),
        ),
      );
}

class _Fact extends StatelessWidget {
  const _Fact({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: SanadColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: SanadColors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontSize: 12.5, color: SanadColors.inkMuted)),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: SanadColors.ink)),
                ],
              ),
            ),
          ],
        ),
      );
}
