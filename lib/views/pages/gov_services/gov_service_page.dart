import 'package:material_ui/material_ui.dart';
import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/pages/activity_page.dart';
import 'package:grad/views/widgets/bottom_nav_bar_widget.dart';
import 'package:grad/views/widgets/civic_emblem.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/sanad_ui.dart';
import 'package:grad/views/widgets/template.dart';

/// Something the citizen can start from a government service page.
class GovAction {
  const GovAction(
      {required this.emblem,
      required this.title,
      required this.description,
      required this.onTap});
  final Emblem emblem;
  final String title;
  final String description;
  final void Function(BuildContext context) onTap;
}

/// The shared layout for government services: what the service is, the
/// actions that start a request, the citizen's own requests for it, and a
/// box to track any request by its reference number.
class GovServicePage extends StatelessWidget {
  const GovServicePage({
    super.key,
    required this.emblem,
    required this.title,
    required this.subtitle,
    required this.actions,
    required this.services,
  });

  final Emblem emblem;
  final String title;
  final String subtitle;
  final List<GovAction> actions;

  /// Request service names shown under "Your requests".
  final List<String> services;

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: context.t('SANAD'),
      index: 1,
      body: ListenableBuilder(
        listenable: sanadStore,
        builder: (context, _) {
          final mine = sanadStore.myRequests
              .where((r) => services.contains(r.service))
              .toList();
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                children: [
                  Row(children: [
                    SizedBox(width: 72, height: 72, child: CivicEmblem(emblem)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context.t(title),
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: SanadColors.ink,
                                    height: 1.2)),
                            const SizedBox(height: 4),
                            Text(context.t(subtitle),
                                style: const TextStyle(
                                    color: SanadColors.inkMuted,
                                    fontSize: 15,
                                    height: 1.4)),
                          ]),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  _Heading(context.t('Start a request')),
                  for (final a in actions)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SanadCard(
                        onTap: () => a.onTap(context),
                        child: Row(children: [
                          SizedBox(
                              width: 52,
                              height: 52,
                              child: CivicEmblem(a.emblem)),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.t(a.title),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: SanadColors.ink)),
                                  const SizedBox(height: 2),
                                  Text(context.t(a.description),
                                      style: const TextStyle(
                                          color: SanadColors.inkMuted,
                                          height: 1.4)),
                                ]),
                          ),
                          const Icon(Icons.chevron_right_rounded,
                              color: SanadColors.primary),
                        ]),
                      ),
                    ),
                  const SizedBox(height: 10),
                  _Heading(context.t('Your requests')),
                  if (mine.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                          context.t(
                              'Nothing yet. Requests you start here appear with their status.'),
                          style: const TextStyle(color: SanadColors.inkMuted)),
                    ),
                  for (final r in mine)
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RequestCard(request: r)),
                  const SizedBox(height: 10),
                  const _TrackBox(),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavBar: BottomNavBar(index: 1),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(text,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: SanadColors.ink)),
      );
}

/// Looks up any request by its reference number and shows its status.
class _TrackBox extends StatefulWidget {
  const _TrackBox();

  @override
  State<_TrackBox> createState() => _TrackBoxState();
}

class _TrackBoxState extends State<_TrackBox> {
  final _controller = TextEditingController();
  ServiceRequest? _found;
  bool _searched = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _check() {
    final ref = _controller.text.trim().toUpperCase();
    setState(() {
      _searched = ref.isNotEmpty;
      _found = sanadStore.requests
          .where((r) => r.reference.toUpperCase() == ref)
          .firstOrNull;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SanadCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(context.t('Track a request'),
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: SanadColors.ink)),
        const SizedBox(height: 4),
        Text(
            context.t(
                'Enter the reference number you received, for example SND-1001.'),
            style: const TextStyle(color: SanadColors.inkMuted)),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.characters,
              onSubmitted: (_) => _check(),
              decoration: InputDecoration(
                hintText: context.t('Reference number'),
                prefixIcon: const Icon(Icons.tag_rounded),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 54,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: SanadColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: _check,
              child: Text(context.t('Check')),
            ),
          ),
        ]),
        if (_searched) ...[
          const SizedBox(height: 12),
          if (_found != null)
            RequestCard(request: _found!)
          else
            Text(
                context
                    .t('No request with that number. Check it and try again.'),
                style: const TextStyle(color: Color(0xFFB3261E))),
        ],
      ]),
    );
  }
}
