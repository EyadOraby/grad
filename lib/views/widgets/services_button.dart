import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

/// A service on the home screen: icon, title, short description and a chevron.
class ServicesButton extends StatelessWidget {
  final String serviceTitle;
  final String? serviceImage;
  final String? serviceDescription;
  final Color color;
  final VoidCallback click;

  const ServicesButton({
    super.key,
    required this.serviceTitle,
    this.serviceImage,
    required this.click,
    required this.color,
    required this.serviceDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: SanadCard(
        onTap: click,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: SanadColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(18),
              ),
              child: serviceImage == null
                  ? null
                  : Image.asset(serviceImage!, fit: BoxFit.contain),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.t(serviceTitle
                        .replaceAll('\n', '')
                        .replaceAll(RegExp(r'\s+'), ' ')
                        .trim()),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: SanadColors.ink),
                  ),
                  if (serviceDescription != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      context.t(serviceDescription!),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12.5,
                          height: 1.45,
                          color: SanadColors.inkMuted),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right_rounded, color: SanadColors.primary),
          ],
        ),
      ),
    );
  }
}
