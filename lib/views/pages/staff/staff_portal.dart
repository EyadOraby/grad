import 'package:flutter/material.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/pages/accessibility_page.dart';
import 'package:grad/views/pages/activity_page.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

/// The staff dashboard and web portal: review requests, appointments and
/// job applications. A navigation rail on wide screens, tabs on phones.
class StaffPortal extends StatefulWidget {
  const StaffPortal({super.key});

  @override
  State<StaffPortal> createState() => _StaffPortalState();
}

class _StaffPortalState extends State<StaffPortal> {
  int _index = 0;

  static const _tabs = [
    (Icons.space_dashboard_outlined, 'Overview'),
    (Icons.badge_outlined, 'Requests'),
    (Icons.event_available_outlined, 'Appointments'),
    (Icons.work_outline_rounded, 'Applications'),
  ];

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;
    final content = ListenableBuilder(
      listenable: sanadStore,
      builder: (context, _) => ListView(
        padding: EdgeInsets.fromLTRB(wide ? 36 : 18, 24, wide ? 36 : 18, 36),
        children: [
          Semantics(
            header: true,
            child: Text(_tabs[_index].$2,
                style: TextStyle(fontSize: wide ? 30 : 24, fontWeight: FontWeight.w800, color: SanadColors.ink)),
          ),
          const SizedBox(height: 18),
          [const _Overview(), const _Requests(), const _Appointments(), const _Applications()][_index],
        ],
      ),
    );
    final header = Container(
      color: SanadColors.primary,
      padding: const EdgeInsets.fromLTRB(20, 14, 12, 14),
      child: SafeArea(
        bottom: false,
        child: Row(children: [
          const Icon(Icons.account_balance_outlined, color: Colors.white),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('SANAD Staff Portal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17)),
              Text('Citizen services · Giza office', style: TextStyle(color: Colors.white70, fontSize: 12.5)),
            ]),
          ),
          IconButton(
            tooltip: 'Accessibility settings',
            color: Colors.white,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AccessibilityPage())),
            icon: const Icon(Icons.accessibility_new_rounded),
          ),
        ]),
      ),
    );
    return Scaffold(
      body: Column(children: [
        header,
        Container(height: 3, color: SanadColors.gold),
        Expanded(
          child: wide
              ? Row(children: [
                  NavigationRail(
                    selectedIndex: _index,
                    onDestinationSelected: (i) => setState(() => _index = i),
                    extended: MediaQuery.sizeOf(context).width >= 1200,
                    backgroundColor: Colors.white,
                    indicatorColor: SanadColors.primary.withValues(alpha: 0.12),
                    destinations: [
                      for (final (icon, label) in _tabs) NavigationRailDestination(icon: Icon(icon), label: Text(label)),
                    ],
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(child: content),
                ])
              : content,
        ),
      ]),
      bottomNavigationBar: wide
          ? null
          : NavigationBar(
              selectedIndex: _index,
              onDestinationSelected: (i) => setState(() => _index = i),
              destinations: [for (final (icon, label) in _tabs) NavigationDestination(icon: Icon(icon), label: label)],
            ),
    );
  }
}

class _Kpi extends StatelessWidget {
  const _Kpi(this.icon, this.label, this.value, [this.color = SanadColors.primary]);
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) => Semantics(
        label: '$label: $value',
        excludeSemantics: true,
        child: SanadCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: SanadColors.ink)),
            Text(label, style: const TextStyle(color: SanadColors.inkMuted)),
          ]),
        ),
      );
}

class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    final s = sanadStore;
    final open = s.requests.where((r) => r.status != RequestStatus.readyForPickup && r.status != RequestStatus.rejected).length;
    final booked = s.appointments.where((a) => a.status == AppointmentStatus.booked).length;
    final newApps = s.applications.where((a) => a.status == ApplicationStatus.applied).length;
    final byStatus = {for (final st in RequestStatus.values) st: s.requests.where((r) => r.status == st).length};
    final max = byStatus.values.fold<int>(1, (m, v) => v > m ? v : m);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      LayoutBuilder(builder: (context, c) {
        final cols = (c.maxWidth / 230).floor().clamp(2, 4);
        final w = (c.maxWidth - (cols - 1) * 14) / cols;
        return Wrap(spacing: 14, runSpacing: 14, children: [
          for (final k in [
            _Kpi(Icons.pending_actions_outlined, 'Open requests', '$open', SanadColors.gold),
            _Kpi(Icons.event_available_outlined, 'Booked appointments', '$booked'),
            _Kpi(Icons.work_outline_rounded, 'New job applications', '$newApps', const Color(0xFF2F6FB0)),
            _Kpi(Icons.check_circle_outline, 'Ready for pickup', '${byStatus[RequestStatus.readyForPickup]}', SanadColors.mint),
          ])
            SizedBox(width: w, child: k),
        ]);
      }),
      const SizedBox(height: 22),
      const Text('Requests by status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: SanadColors.ink)),
      const SizedBox(height: 10),
      SanadCard(
        child: Column(children: [
          for (final e in byStatus.entries)
            Semantics(
              label: '${e.key.label}: ${e.value}',
              excludeSemantics: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(children: [
                  SizedBox(width: 130, child: Text(e.key.label, style: const TextStyle(fontWeight: FontWeight.w600))),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: e.value / max,
                        minHeight: 12,
                        color: e.key == RequestStatus.rejected ? const Color(0xFFB3261E) : SanadColors.primary,
                        backgroundColor: SanadColors.surface,
                      ),
                    ),
                  ),
                  SizedBox(width: 36, child: Text('${e.value}', textAlign: TextAlign.end)),
                ]),
              ),
            ),
        ]),
      ),
    ]);
  }
}

class _Requests extends StatelessWidget {
  const _Requests();

  @override
  Widget build(BuildContext context) {
    final list = [...sanadStore.requests]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return Column(children: [
      for (final r in list)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: RequestCard(
            request: r,
            actions: r.status.next == null
                ? null
                : Wrap(spacing: 8, children: [
                    FilledButton(
                      onPressed: () => sanadStore.advanceRequest(r.reference),
                      child: Text(switch (r.status.next!) {
                        RequestStatus.underReview => 'Start review',
                        RequestStatus.approved => 'Approve',
                        _ => 'Mark ready for pickup',
                      }),
                    ),
                    OutlinedButton(
                      onPressed: () => sanadStore.rejectRequest(r.reference),
                      child: const Text('Reject'),
                    ),
                  ]),
          ),
        ),
    ]);
  }
}

class _Appointments extends StatelessWidget {
  const _Appointments();

  @override
  Widget build(BuildContext context) {
    final list = [...sanadStore.appointments]..sort((a, b) => a.when.compareTo(b.when));
    return SanadCard(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Citizen')),
            DataColumn(label: Text('With')),
            DataColumn(label: Text('When')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Action')),
          ],
          rows: [
            for (final a in list)
              DataRow(cells: [
                DataCell(Text(a.citizen)),
                DataCell(Text(a.provider)),
                DataCell(Text(formatSlot(a.when))),
                DataCell(Text(switch (a.status) {
                  AppointmentStatus.booked => 'Booked',
                  AppointmentStatus.completed => 'Completed',
                  AppointmentStatus.cancelled => 'Cancelled',
                })),
                DataCell(a.status == AppointmentStatus.booked
                    ? TextButton(onPressed: () => sanadStore.completeAppointment(a.id), child: const Text('Mark attended'))
                    : const SizedBox()),
              ]),
          ],
        ),
      ),
    );
  }
}

class _Applications extends StatelessWidget {
  const _Applications();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (final a in sanadStore.applications)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SanadCard(
            child: Row(children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${a.jobTitle} · ${a.company}', style: const TextStyle(fontWeight: FontWeight.w700, color: SanadColors.ink)),
                  Text('${a.citizen} · ${a.status.label}', style: const TextStyle(color: SanadColors.inkMuted)),
                ]),
              ),
              if (a.status.next != null) ...[
                FilledButton(
                  onPressed: () => sanadStore.advanceApplication(a.id),
                  child: Text(a.status.next == ApplicationStatus.shortlisted ? 'Shortlist' : 'Invite to interview'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: () => sanadStore.rejectApplication(a.id), child: const Text('Decline')),
              ],
            ]),
          ),
        ),
    ]);
  }
}
