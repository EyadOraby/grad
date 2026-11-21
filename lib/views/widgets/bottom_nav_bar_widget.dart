import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/activity_page.dart';
import 'package:grad/views/pages/gov_services/gov_services_page.dart';
import 'package:grad/views/pages/jobs_services/jobs_page.dart';
import 'package:grad/views/pages/medical_services/medical_services_page.dart';

/// Bottom navigation shared by the main sections.
///
/// Switching tabs replaces the current section instead of stacking a new
/// page on every tap, so the back button always returns to Home.
class BottomNavBar extends StatelessWidget {
  final int index;
  const BottomNavBar({super.key, required this.index});

  List<NavigationDestination> _destinations(BuildContext context) => [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: context.t('Home'),
        ),
        NavigationDestination(
          icon: Icon(Icons.badge_outlined),
          selectedIcon: Icon(Icons.badge_rounded),
          label: context.t('Gov'),
        ),
        NavigationDestination(
          icon: Icon(Icons.medical_services_outlined),
          selectedIcon: Icon(Icons.medical_services_rounded),
          label: context.t('Medical'),
        ),
        NavigationDestination(
          icon: Icon(Icons.work_outline_rounded),
          selectedIcon: Icon(Icons.work_rounded),
          label: context.t('Jobs'),
        ),
        NavigationDestination(
          icon: Icon(Icons.inbox_outlined),
          selectedIcon: Icon(Icons.inbox_rounded),
          label: context.t('Activity'),
        ),
      ];

  Widget? _pageFor(int i) {
    switch (i) {
      case 1:
        return const GovServicesPage();
      case 2:
        return const MedicalServicesPage();
      case 3:
        return const JobsPage();
      case 4:
        return const ActivityPage();
      default:
        return null;
    }
  }

  void _open(BuildContext context, int i) {
    if (i == index) return;
    final navigator = Navigator.of(context);
    final page = _pageFor(i);
    if (page == null) {
      navigator.popUntil((route) => route.isFirst);
      return;
    }
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 180),
    );
    if (index == 0) {
      navigator.push(route);
    } else {
      navigator.pushReplacement(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      destinations: _destinations(context),
      onDestinationSelected: (i) => _open(context, i),
    );
  }
}
