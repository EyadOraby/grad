import 'package:flutter/material.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

/// Text size, contrast, motion and weight, applied across the whole app.
class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility')),
      body: ListenableBuilder(
        listenable: sanadStore,
        builder: (context, _) {
          final s = sanadStore.settings;
          void update(AccessibilitySettings next) => sanadStore.updateSettings(next);
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text('Make SANAD comfortable to use',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: SanadColors.ink)),
              const SizedBox(height: 6),
              const Text('These settings apply to every screen and are saved on this device.',
                  style: TextStyle(color: SanadColors.inkMuted)),
              const SizedBox(height: 20),
              SanadCard(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    const Icon(Icons.format_size_rounded, color: SanadColors.primary),
                    const SizedBox(width: 10),
                    const Expanded(child: Text('Text size', style: TextStyle(fontWeight: FontWeight.w700))),
                    Text('${(s.textScale * 100).round()}%'),
                  ]),
                  Slider(
                    value: s.textScale,
                    min: 1,
                    max: 1.6,
                    divisions: 6,
                    label: '${(s.textScale * 100).round()}%',
                    semanticFormatterCallback: (v) => 'Text size ${(v * 100).round()} percent',
                    onChanged: (v) => update(s.copyWith(textScale: v)),
                  ),
                  const Text('Preview: Book a doctor in a few taps.', style: TextStyle(color: SanadColors.inkMuted)),
                ]),
              ),
              const SizedBox(height: 12),
              SanadCard(
                padding: EdgeInsets.zero,
                child: Column(children: [
                  SwitchListTile(
                    secondary: const Icon(Icons.contrast_rounded),
                    title: const Text('High contrast'),
                    subtitle: const Text('Black text, stronger borders and darker buttons'),
                    value: s.highContrast,
                    onChanged: (v) => update(s.copyWith(highContrast: v)),
                  ),
                  SwitchListTile(
                    secondary: const Icon(Icons.format_bold_rounded),
                    title: const Text('Bold text'),
                    subtitle: const Text('Heavier text that is easier to read'),
                    value: s.boldText,
                    onChanged: (v) => update(s.copyWith(boldText: v)),
                  ),
                  SwitchListTile(
                    secondary: const Icon(Icons.motion_photos_off_outlined),
                    title: const Text('Reduce motion'),
                    subtitle: const Text('Turn off animations and transitions'),
                    value: s.reduceMotion,
                    onChanged: (v) => update(s.copyWith(reduceMotion: v)),
                  ),
                ]),
              ),
              const SizedBox(height: 12),
              const SanadCard(
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.record_voice_over_outlined, color: SanadColors.primary),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'SANAD works with TalkBack and VoiceOver: buttons, progress and statuses are labelled for screen readers.',
                      style: TextStyle(color: SanadColors.inkMuted, height: 1.45),
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Applies the settings: text scale, bold text and reduced motion via
/// MediaQuery, and high contrast via the theme.
Widget applyAccessibility(BuildContext context, Widget? child, AccessibilitySettings s) {
  final media = MediaQuery.of(context);
  return MediaQuery(
    data: media.copyWith(
      textScaler: TextScaler.linear(s.textScale),
      boldText: s.boldText || media.boldText,
      disableAnimations: s.reduceMotion || media.disableAnimations,
    ),
    child: child ?? const SizedBox(),
  );
}
