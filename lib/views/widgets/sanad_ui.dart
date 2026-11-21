import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';

/// Small building blocks shared by SANAD's redesigned screens.

/// A white, softly shadowed surface with rounded corners.
class SanadCard extends StatelessWidget {
  const SanadCard(
      {super.key,
      required this.child,
      this.onTap,
      this.padding = const EdgeInsets.all(16)});

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SanadColors.card,
        borderRadius: BorderRadius.circular(22),
        border: sanadStore.settings.highContrast
            ? Border.all(color: Colors.black, width: 1.5)
            : Border.all(color: SanadColors.line),
        boxShadow: const [
          BoxShadow(
              color: Color(0x0F0F5C4A), blurRadius: 24, offset: Offset(0, 10))
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

/// A row of icon + text used for location, days and hours.
class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: SanadColors.primarySoft),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              context.t(text),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 12.5, color: SanadColors.inkMuted),
            ),
          ),
        ],
      ),
    );
  }
}

/// Gold star with the rating value.
class RatingChip extends StatelessWidget {
  const RatingChip({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: SanadColors.gold.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 15, color: SanadColors.gold),
          const SizedBox(width: 3),
          Text(rating,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: SanadColors.ink)),
        ],
      ),
    );
  }
}

/// A provider card (doctor, hospital, center) for two-column grids.
class ProviderCard extends StatelessWidget {
  const ProviderCard({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.location,
    required this.days,
    required this.hours,
    required this.rating,
    required this.onBook,
  });

  final String image;
  final String title;
  final String? subtitle;
  final String location;
  final String days;
  final String hours;
  final String rating;
  final VoidCallback onBook;

  @override
  Widget build(BuildContext context) {
    // Two per row on phones, capped on wide screens.
    final width =
        ((MediaQuery.sizeOf(context).width - 36) / 2).clamp(140.0, 280.0);
    return Container(
      width: width,
      padding: const EdgeInsets.all(6),
      child: SanadCard(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: SanadColors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
                const Spacer(),
                RatingChip(rating: rating),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: SanadColors.ink,
                  height: 1.25),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(context.t(subtitle!),
                    style:
                        TextStyle(fontSize: 12.5, color: SanadColors.primary)),
              ),
            const SizedBox(height: 6),
            InfoRow(icon: Icons.location_on_outlined, text: location),
            InfoRow(icon: Icons.calendar_month_outlined, text: days),
            InfoRow(icon: Icons.schedule_rounded, text: hours),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onBook,
                style: FilledButton.styleFrom(
                  backgroundColor: SanadColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(context.t('Book'),
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
