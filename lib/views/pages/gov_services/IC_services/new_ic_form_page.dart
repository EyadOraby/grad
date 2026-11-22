import 'package:material_ui/material_ui.dart';
import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/views/widgets/bottom_nav_bar_widget.dart';
import 'package:grad/views/widgets/civic_emblem.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/sanad_ui.dart';
import 'package:grad/views/widgets/template.dart';

/// Application for a new integrated services card: social status, then a
/// day and time for the medical check-up, then one button to send.
class NewICFormPage extends StatefulWidget {
  const NewICFormPage({super.key, this.today});

  /// Overrides "today" in tests.
  final DateTime? today;

  @override
  State<NewICFormPage> createState() => _NewICFormPageState();
}

class _NewICFormPageState extends State<NewICFormPage> {
  static const statuses = ['Unmarried', 'Married', 'Divorced'];
  static const times = ['09:00', '10:30', '12:00', '13:30'];

  String? _status;
  DateTime? _day;
  String? _time;
  bool _tried = false;

  DateTime get _today {
    final t = widget.today ?? DateTime.now();
    return DateTime(t.year, t.month, t.day);
  }

  /// The next ten working days (Friday and Saturday are the weekend).
  List<DateTime> get _days {
    final days = <DateTime>[];
    var d = _today.add(const Duration(days: 1));
    while (days.length < 10) {
      if (d.weekday != DateTime.friday && d.weekday != DateTime.saturday) {
        days.add(d);
      }
      d = d.add(const Duration(days: 1));
    }
    return days;
  }

  bool get _complete => _status != null && _day != null && _time != null;

  Future<void> _submit() async {
    setState(() => _tried = true);
    if (!_complete) return;
    final when =
        '${_day!.year}-${_day!.month.toString().padLeft(2, '0')}-${_day!.day.toString().padLeft(2, '0')} $_time';
    await submitServiceRequest(context,
        service: 'Integrated services card',
        details: 'Social status: $_status; check-up: $when');
    if (mounted) Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: context.t('SANAD'),
      index: 1,
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            children: [
              Row(children: [
                const SizedBox(
                    width: 64, height: 64, child: CivicEmblem(Emblem.newCard)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.t('New integrated services card'),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: SanadColors.ink)),
                        Text(context.t('Three short questions.'),
                            style: const TextStyle(
                                color: SanadColors.inkMuted, fontSize: 15)),
                      ]),
                ),
              ]),
              const SizedBox(height: 18),
              _Step(
                number: 1,
                title: context.t('Social status'),
                error: _tried && _status == null
                    ? context.t('Please choose social status')
                    : null,
                child: Wrap(spacing: 8, runSpacing: 8, children: [
                  for (final s in statuses)
                    ChoiceChip(
                      label: Text(context.t(s)),
                      selected: _status == s,
                      onSelected: (_) => setState(() => _status = s),
                    ),
                ]),
              ),
              _Step(
                number: 2,
                title: context.t('Day of your medical check-up'),
                error: _tried && _day == null
                    ? context.t('Please choose date')
                    : null,
                child: SizedBox(
                  height: 76,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _days.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, i) {
                      final d = _days[i];
                      final selected = _day == d;
                      return Semantics(
                        button: true,
                        selected: selected,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () => setState(() => _day = d),
                          child: Container(
                            width: 64,
                            decoration: BoxDecoration(
                              color: selected
                                  ? SanadColors.primary
                                  : SanadColors.card,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: selected
                                      ? SanadColors.primary
                                      : SanadColors.line),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(context.t(weekdays[d.weekday - 1]),
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: selected
                                              ? Colors.white70
                                              : SanadColors.inkMuted)),
                                  Text('${d.day}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: selected
                                              ? Colors.white
                                              : SanadColors.ink)),
                                ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              _Step(
                number: 3,
                title: context.t('Time'),
                error: _tried && _time == null
                    ? context.t('Please choose time')
                    : null,
                child: Wrap(spacing: 8, runSpacing: 8, children: [
                  for (final t in times)
                    ChoiceChip(
                      label: Text(t),
                      selected: _time == t,
                      onSelected: (_) => setState(() => _time = t),
                    ),
                ]),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 54,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: SanadColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    textStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  onPressed: _submit,
                  child: Text(context.t('Send application')),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavBar: BottomNavBar(index: 1),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step(
      {required this.number,
      required this.title,
      required this.child,
      this.error});
  final int number;
  final String title;
  final Widget child;
  final String? error;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: SanadCard(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: SanadColors.primary,
                child: Text('$number',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: SanadColors.ink)),
              ),
            ]),
            const SizedBox(height: 12),
            child,
            if (error != null) ...[
              const SizedBox(height: 8),
              Text(error!,
                  style:
                      const TextStyle(color: Color(0xFFB3261E), fontSize: 13)),
            ],
          ]),
        ),
      );
}
