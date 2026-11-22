import 'package:grad/l10n/sanad_strings.dart';
import 'package:material_ui/material_ui.dart';
import 'package:grad/views/widgets/civic_emblem.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

/// A category tile (doctors, hospitals, ...) in a two-column grid.
class MedicalCategoryServicesButton extends StatelessWidget {
  final String serviceTitle;
  final String serviceImage;
  final Color color;
  final VoidCallback click;

  const MedicalCategoryServicesButton({
    super.key,
    required this.serviceTitle,
    required this.serviceImage,
    required this.color,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    final width =
        ((MediaQuery.sizeOf(context).width - 36) / 2).clamp(140.0, 280.0);
    return Container(
      width: width,
      padding: const EdgeInsets.all(6),
      child: SanadCard(
        onTap: click,
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72,
              height: 72,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: sanadArt(serviceImage),
            ),
            const SizedBox(height: 14),
            Text(
              serviceTitle
                  .replaceAll('\n', ' ')
                  .replaceAll(RegExp(r'\s+'), ' ')
                  .trim(),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: SanadColors.ink,
                  height: 1.25),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(context.t('Explore'),
                    style: TextStyle(
                        fontSize: 12.5,
                        color: SanadColors.primary,
                        fontWeight: FontWeight.w600)),
                Icon(Icons.arrow_forward_rounded,
                    size: 15, color: SanadColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
