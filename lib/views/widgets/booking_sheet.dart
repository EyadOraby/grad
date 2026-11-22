import 'package:grad/l10n/sanad_strings.dart';
import 'package:material_ui/material_ui.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';

const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _slots = [9, 10, 11, 13, 14, 16, 18, 19];

String formatSlot(DateTime d) {
  final h = d.hour % 12 == 0 ? 12 : d.hour % 12;
  return '${_weekdays[d.weekday - 1]} ${d.day}/${d.month} · $h:00 ${d.hour < 12 ? 'AM' : 'PM'}';
}

/// Pick a day and time, then confirm. Taken slots are disabled.
Future<void> showBookingSheet(BuildContext context,
    {required String provider, required String kind}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Colors.white,
    builder: (_) =>
        _BookingSheet(provider: provider, kind: kind, outer: context),
  );
}

class _BookingSheet extends StatefulWidget {
  const _BookingSheet(
      {required this.provider, required this.kind, required this.outer});
  final String provider;
  final String kind;
  final BuildContext outer;

  @override
  State<_BookingSheet> createState() => _BookingSheetState();
}

class _BookingSheetState extends State<_BookingSheet> {
  late final List<DateTime> _days = [
    for (var i = 1; i <= 7; i++)
      DateUtils.dateOnly(DateTime.now()).add(Duration(days: i)),
  ];
  late DateTime _day = _days.first;
  int? _hour;

  bool _taken(int hour) {
    final when = DateTime(_day.year, _day.month, _day.day, hour);
    return sanadStore.appointments.any((a) =>
        a.provider == widget.provider &&
        a.when == when &&
        a.status == AppointmentStatus.booked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${context.t('Book with')} ${widget.provider}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: SanadColors.ink)),
          const SizedBox(height: 4),
          Text(context.t('Choose a day and a time that works for you.'),
              style: TextStyle(color: SanadColors.inkMuted)),
          const SizedBox(height: 18),
          Text(context.t('Day'),
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: SanadColors.ink)),
          const SizedBox(height: 8),
          SizedBox(
            height: 74,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _days.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final d = _days[i];
                final selected = d == _day;
                return Semantics(
                  button: true,
                  selected: selected,
                  label: '${_weekdays[d.weekday - 1]} ${d.day} ${d.month}',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => setState(() {
                      _day = d;
                      _hour = null;
                    }),
                    child: Container(
                      width: 62,
                      decoration: BoxDecoration(
                        color: selected
                            ? SanadColors.primary
                            : SanadColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: selected
                                ? SanadColors.primary
                                : SanadColors.line),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_weekdays[d.weekday - 1],
                                style: TextStyle(
                                    color: selected
                                        ? Colors.white70
                                        : SanadColors.inkMuted,
                                    fontSize: 12)),
                            Text('${d.day}',
                                style: TextStyle(
                                    color: selected
                                        ? Colors.white
                                        : SanadColors.ink,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800)),
                          ]),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(context.t('Time'),
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: SanadColors.ink)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final h in _slots)
                ChoiceChip(
                  label: Text(
                      '${h % 12 == 0 ? 12 : h % 12}:00 ${h < 12 ? 'AM' : 'PM'}'),
                  selected: _hour == h,
                  onSelected:
                      _taken(h) ? null : (_) => setState(() => _hour = h),
                  selectedColor: SanadColors.primary,
                  labelStyle: TextStyle(
                      color: _hour == h ? Colors.white : SanadColors.ink,
                      fontWeight: FontWeight.w600),
                  showCheckmark: false,
                ),
            ],
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed: _hour == null
                  ? null
                  : () {
                      final when =
                          DateTime(_day.year, _day.month, _day.day, _hour!);
                      final booked = sanadStore.book(
                          provider: widget.provider,
                          kind: widget.kind,
                          when: when);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(widget.outer).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(booked == null
                            ? context.t(
                                'That time was just taken. Please pick another.')
                            : 'Booked for ${formatSlot(when)}. See it in Activity.'),
                      ));
                    },
              style: FilledButton.styleFrom(
                backgroundColor: SanadColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: Text(
                  _hour == null
                      ? context.t('Choose a time')
                      : context.t('Confirm booking'),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}

/// Sends a government request and shows its reference number.
Future<void> submitServiceRequest(BuildContext context,
    {required String service, String details = ''}) {
  final request = sanadStore.submitRequest(service: service, details: details);
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.verified_rounded,
          color: SanadColors.primary, size: 48),
      title: Text(context.t('Request submitted')),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('${context.t(service)} ${context.t('has been sent for review.')}',
            textAlign: TextAlign.center),
        const SizedBox(height: 14),
        Text(context.t('Your reference number'),
            style: TextStyle(color: SanadColors.inkMuted)),
        SelectableText(request.reference,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: SanadColors.primary)),
        const SizedBox(height: 8),
        Text(context.t('Track its status any time from Activity.'),
            textAlign: TextAlign.center),
      ]),
      actions: [
        FilledButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.t('Done')))
      ],
    ),
  );
}
