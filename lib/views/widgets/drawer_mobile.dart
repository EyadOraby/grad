import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/pages/accessibility_page.dart';
import 'package:grad/views/pages/activity_page.dart';
import 'package:grad/views/pages/gov_services/gov_services_page.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/jobs_services/jobs_page.dart';
import 'package:grad/views/pages/login_page.dart';
import 'package:grad/views/pages/medical_services/medical_services_page.dart';
import 'package:grad/views/pages/staff/staff_portal.dart' deferred as staff;
import 'package:grad/views/widgets/deferred_view.dart';

/// Navigation for the citizen app: the phone drawer and the desktop side menu.
class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    void open(Widget page, {bool replace = true}) {
      final route = MaterialPageRoute(builder: (_) => page);
      if (replace) {
        Navigator.pushAndRemoveUntil(context, route, (r) => r.isFirst);
      } else {
        Navigator.push(context, route);
      }
    }

    final active = sanadStore.myRequests
        .where((r) => r.status != RequestStatus.readyForPickup)
        .length;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [SanadColors.primary, SanadColors.primaryDark]),
          ),
          child: Row(children: [
            const CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
              child: Icon(Icons.person_rounded,
                  color: SanadColors.primary, size: 30),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.t('Demo citizen'),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 17)),
                    Text('$active ${context.t('open requests')}',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ]),
            ),
          ]),
        ),
        Container(height: 3, color: SanadColors.gold),
        const SizedBox(height: 8),
        _Item(Icons.home_outlined, context.t('Home'), () => open(HomePage())),
        _Item(Icons.badge_outlined, context.t('Government services'),
            () => open(GovServicesPage())),
        _Item(Icons.medical_services_outlined, context.t('Medical services'),
            () => open(MedicalServicesPage())),
        _Item(Icons.work_outline_rounded, context.t('Jobs'),
            () => open(JobsPage())),
        _Item(Icons.inbox_outlined, context.t('Activity'),
            () => open(ActivityPage())),
        const Divider(indent: 16, endIndent: 16),
        _Item(Icons.translate_rounded, context.isArabic ? 'English' : 'العربية',
            sanadStore.toggleLanguage),
        _Item(Icons.accessibility_new_rounded, context.t('Accessibility'),
            () => open(AccessibilityPage(), replace: false)),
        _Item(Icons.account_balance_outlined, context.t('Staff portal'),
            () => open(DeferredView(load: staff.loadLibrary, builder: () => staff.StaffPortal()), replace: false)),
        _Item(
          Icons.logout_rounded,
          context.t('Sign out'),
          () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (r) => false,
          ),
          danger: true,
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.icon, this.label, this.onTap, {this.danger = false});
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final color = danger ? const Color(0xFFB3261E) : SanadColors.ink;
    return ListTile(
      minTileHeight: 52,
      leading: Icon(icon, color: danger ? color : SanadColors.primary),
      title: Text(context.t(label),
          style: TextStyle(fontWeight: FontWeight.w600, color: color)),
      onTap: onTap,
    );
  }
}
