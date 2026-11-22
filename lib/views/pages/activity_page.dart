import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/widgets/civic_emblem.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/bottom_nav_bar_widget.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/sanad_ui.dart';
import 'package:grad/views/widgets/template.dart';

/// Everything the citizen has started: appointments, requests and job applications.
class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      appBarTitle: context.t('Activity'),
      index: 4,
      drawerMobile: const DrawerMobile(),
      bottomNavBar: const BottomNavBar(index: 4),
      body: ListenableBuilder(
        listenable: sanadStore,
        builder: (context, _) {
          final appointments = sanadStore.myAppointments;
          final requests = sanadStore.myRequests;
          final applications = sanadStore.myApplications;
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            children: [
              Semantics(
                header: true,
                child: Text(context.t('Your activity'),
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: SanadColors.ink)),
              ),
              const SizedBox(height: 4),
              Text(
                  context.t(
                      'Appointments, requests and applications in one place.'),
                  style: TextStyle(color: SanadColors.inkMuted)),
              _Header(
                  context.t('Appointments'),
                  appointments
                      .where((a) => a.status == AppointmentStatus.booked)
                      .length),
              if (appointments.isEmpty)
                _Empty(
                    context.t('Book a doctor or hospital from Medical services.'),
                    Emblem.doctor),
              for (final a in appointments)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SanadCard(
                    child: Row(children: [
                      _Badge(
                          icon: a.kind == 'Doctor'
                              ? Icons.medical_services_outlined
                              : Icons.local_hospital_outlined),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(a.provider,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: SanadColors.ink)),
                              Text(formatSlot(a.when),
                                  style: const TextStyle(
                                      color: SanadColors.inkMuted,
                                      fontSize: 13)),
                            ]),
                      ),
                      if (a.status == AppointmentStatus.booked)
                        TextButton(
                            onPressed: () => sanadStore.cancelAppointment(a.id),
                            child: Text(context.t('Cancel')))
                      else
                        _StatusText(a.status == AppointmentStatus.cancelled
                            ? context.t('Cancelled')
                            : context.t('Completed')),
                    ]),
                  ),
                ),
              _Header(context.t('Government requests'), requests.length),
              if (requests.isEmpty)
                _Empty(
                    context.t(
                        'Renew your ID or apply for a services card from Government.'),
                    Emblem.government),
              for (final r in requests)
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RequestCard(request: r)),
              _Header(context.t('Job applications'), applications.length),
              if (applications.isEmpty)
                _Empty(context.t('Apply to jobs that suit you from Jobs.'),
                    Emblem.jobs),
              for (final a in applications)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SanadCard(
                    child: Row(children: [
                      const _Badge(icon: Icons.work_outline_rounded),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(a.jobTitle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: SanadColors.ink)),
                              Text(a.company,
                                  style: const TextStyle(
                                      color: SanadColors.inkMuted,
                                      fontSize: 13)),
                            ]),
                      ),
                      _StatusText(context.t(a.status.label)),
                    ]),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request, this.actions});
  final ServiceRequest request;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    const steps = [
      RequestStatus.submitted,
      RequestStatus.underReview,
      RequestStatus.approved,
      RequestStatus.readyForPickup
    ];
    final reached = steps.indexOf(request.status);
    final rejected = request.status == RequestStatus.rejected;
    return SanadCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const _Badge(icon: Icons.badge_outlined),
          const SizedBox(width: 12),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(context.t(request.service),
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: SanadColors.ink)),
              Text(
                  '${context.t('Ref')} ${request.reference} · ${context.t(request.citizen)}',
                  style: TextStyle(color: SanadColors.inkMuted, fontSize: 13)),
              if (request.details.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(request.details,
                      style: const TextStyle(
                          color: SanadColors.ink, fontSize: 13, height: 1.35)),
                ),
            ]),
          ),
          _StatusText(context.t(request.status.label),
              color: rejected ? Color(0xFFB3261E) : null),
        ]),
        if (!rejected) ...[
          const SizedBox(height: 14),
          Semantics(
            label:
                'Progress: ${request.status.label}, step ${reached + 1} of ${steps.length}',
            child: ExcludeSemantics(
              child: Row(children: [
                for (var i = 0; i < steps.length; i++) ...[
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          i <= reached ? SanadColors.primary : SanadColors.line,
                    ),
                    child: i <= reached
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : null,
                  ),
                  if (i < steps.length - 1)
                    Expanded(
                        child: Container(
                            height: 3,
                            color: i < reached
                                ? SanadColors.primary
                                : SanadColors.line)),
                ],
              ]),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final s in steps)
                Text(context.t(s.label),
                    style:
                        TextStyle(fontSize: 10.5, color: SanadColors.inkMuted))
            ],
          ),
        ],
        if (actions != null) ...[const SizedBox(height: 10), actions!],
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.title, this.count);
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 10),
        child: Semantics(
          header: true,
          child: Row(children: [
            Text(context.t(title),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: SanadColors.ink)),
            const SizedBox(width: 8),
            Text('$count', style: const TextStyle(color: SanadColors.inkMuted)),
          ]),
        ),
      );
}

/// An empty section: the section's emblem beside a hint on where to start.
class _Empty extends StatelessWidget {
  const _Empty(this.text, this.emblem);
  final String text;
  final Emblem emblem;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SanadCard(
          child: Row(children: [
            SizedBox(width: 52, height: 52, child: CivicEmblem(emblem)),
            const SizedBox(width: 14),
            Expanded(
              child: Text(context.t(text),
                  style: const TextStyle(color: SanadColors.inkMuted, height: 1.4)),
            ),
          ]),
        ),
      );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            color: SanadColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14)),
        child: Icon(icon, color: SanadColors.primary),
      );
}

class _StatusText extends StatelessWidget {
  const _StatusText(this.text, {this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: (color ?? SanadColors.primary).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text,
            style: TextStyle(
                color: color ?? SanadColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 12)),
      );
}
