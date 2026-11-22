import 'package:flutter/material.dart';
import 'package:grad/theme/sanad_colors.dart';

/// SANAD's illustration style: calm geometric emblems built from circles,
/// rectangles and arches in teal, sand and gold. Each sits on a sand disc,
/// with no outlines, shadows or gradients, so it stays clear at any size and
/// in high-contrast mode.
enum Emblem { government, medical, jobs, doctor, hospital, scan, physio, newCard, renewCard, id, applications, assistant }

/// The emblem that replaces one of the old illustration PNGs, if any.
Emblem? emblemForAsset(String asset) {
  final name = asset.split('/').last.toLowerCase();
  if (name.startsWith('government')) return Emblem.government;
  if (name.startsWith('medical2')) return Emblem.medical;
  if (name.startsWith('job')) return Emblem.jobs;
  if (name.startsWith('doctor')) return Emblem.doctor;
  if (name.startsWith('hospital')) return Emblem.hospital;
  if (name.startsWith('medical-scan')) return Emblem.scan;
  if (name.startsWith('pyiso')) return Emblem.physio;
  if (name.startsWith('new-card')) return Emblem.newCard;
  if (name.startsWith('renew-card')) return Emblem.renewCard;
  if (name.startsWith('id-icon')) return Emblem.id;
  if (name.startsWith('applications')) return Emblem.applications;
  return null;
}

/// Shows the emblem for [asset], falling back to the image itself.
Widget sanadArt(String asset, {BoxFit fit = BoxFit.contain}) {
  final emblem = emblemForAsset(asset);
  return emblem == null ? Image.asset(asset, fit: fit) : CivicEmblem(emblem);
}

class CivicEmblem extends StatelessWidget {
  const CivicEmblem(this.emblem, {super.key});

  final Emblem emblem;

  @override
  Widget build(BuildContext context) => AspectRatio(aspectRatio: 1, child: CustomPaint(painter: _EmblemPainter(emblem)));
}

const _sand = Color(0xFFEFE6D4);
const _teal = SanadColors.primary;
const _tealSoft = SanadColors.primarySoft;
const _gold = SanadColors.gold;
const _white = Color(0xFFFFFDF9);

class _EmblemPainter extends CustomPainter {
  _EmblemPainter(this.emblem);

  final Emblem emblem;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    canvas.translate((size.width - s) / 2, (size.height - s) / 2);
    final p = Paint();
    canvas.drawCircle(Offset(s / 2, s / 2), s / 2, p..color = _sand);

    Rect r(double l, double t, double w, double h) => Rect.fromLTWH(s * l, s * t, s * w, s * h);
    void rect(double l, double t, double w, double h, Color c, [double radius = 0]) =>
        canvas.drawRRect(RRect.fromRectAndRadius(r(l, t, w, h), Radius.circular(s * radius)), p..color = c);
    void circle(double x, double y, double rad, Color c) => canvas.drawCircle(Offset(s * x, s * y), s * rad, p..color = c);
    void plus(double x, double y, double len, double w, Color c) {
      rect(x - w / 2, y - len / 2, w, len, c, w * .2);
      rect(x - len / 2, y - w / 2, len, w, c, w * .2);
    }

    void card(double l, double t, Color body, Color stripe) {
      rect(l, t, .5, .34, body, .05);
      rect(l, t + .07, .5, .06, stripe);
      circle(l + .12, t + .23, .05, _white);
      rect(l + .22, t + .19, .2, .04, _white, .02);
      rect(l + .22, t + .25, .14, .03, _white, .015);
    }

    switch (emblem) {
      case Emblem.government:
        // A pediment, four columns and a base.
        canvas.drawPath(
          Path()
            ..moveTo(s * .2, s * .38)
            ..lineTo(s * .5, s * .2)
            ..lineTo(s * .8, s * .38)
            ..close(),
          p..color = _teal,
        );
        for (final x in [.26, .39, .52, .65]) {
          rect(x, .42, .08, .26, _tealSoft, .01);
        }
        rect(.2, .7, .6, .07, _teal, .01);
        circle(.5, .31, .035, _gold);
      case Emblem.medical:
        circle(.5, .5, .26, _teal);
        plus(.5, .5, .28, .1, _white);
        circle(.72, .28, .07, _gold);
      case Emblem.jobs:
        rect(.38, .26, .24, .1, _tealSoft, .04);
        rect(.42, .3, .16, .06, _sand);
        rect(.22, .34, .56, .38, _teal, .06);
        rect(.22, .48, .56, .04, _tealSoft);
        rect(.45, .45, .1, .1, _gold, .02);
      case Emblem.doctor:
        circle(.5, .34, .13, _tealSoft);
        canvas.drawPath(
          Path()
            ..moveTo(s * .24, s * .8)
            ..quadraticBezierTo(s * .26, s * .52, s * .5, s * .52)
            ..quadraticBezierTo(s * .74, s * .52, s * .76, s * .8)
            ..close(),
          p..color = _teal,
        );
        plus(.5, .66, .12, .04, _gold);
      case Emblem.hospital:
        rect(.24, .3, .52, .46, _teal, .03);
        rect(.42, .58, .16, .18, _sand, .02);
        plus(.5, .43, .16, .06, _white);
        rect(.3, .22, .4, .1, _tealSoft, .03);
      case Emblem.scan:
        rect(.24, .24, .52, .52, _teal, .08);
        circle(.5, .5, .16, _white);
        circle(.5, .5, .09, _tealSoft);
        rect(.3, .66, .4, .04, _gold, .02);
      case Emblem.physio:
        // A figure stretching: head, body and raised arms.
        circle(.5, .26, .08, _gold);
        rect(.45, .35, .1, .28, _teal, .05);
        canvas.drawPath(
          Path()
            ..moveTo(s * .47, s * .4)
            ..lineTo(s * .24, s * .24)
            ..lineTo(s * .27, s * .2)
            ..lineTo(s * .52, s * .36)
            ..close(),
          p..color = _tealSoft,
        );
        canvas.drawPath(
          Path()
            ..moveTo(s * .53, s * .4)
            ..lineTo(s * .76, s * .24)
            ..lineTo(s * .73, s * .2)
            ..lineTo(s * .48, s * .36)
            ..close(),
          p..color = _tealSoft,
        );
        rect(.4, .62, .07, .18, _teal, .03);
        rect(.53, .62, .07, .18, _teal, .03);
      case Emblem.newCard:
        card(.25, .33, _teal, _tealSoft);
        circle(.74, .3, .1, _gold);
        plus(.74, .3, .1, .03, _white);
      case Emblem.renewCard:
        card(.25, .33, _teal, _tealSoft);
        final arc = Paint()
          ..color = _gold
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * .05
          ..strokeCap = StrokeCap.round;
        canvas.drawArc(r(.6, .18, .22, .22), 3.6, 4.6, false, arc);
      case Emblem.id:
        card(.25, .33, _tealSoft, _teal);
      case Emblem.assistant:
        rect(.2, .26, .44, .3, _teal, .08);
        canvas.drawPath(Path()..moveTo(s * .3, s * .54)..lineTo(s * .28, s * .66)..lineTo(s * .42, s * .55)..close(), p..color = _teal);
        rect(.42, .46, .38, .26, _gold, .08);
        for (final x in [.31, .41, .51]) {
          circle(x, .41, .03, _white);
        }
      case Emblem.applications:
        rect(.3, .22, .4, .54, _teal, .04);
        for (final y in [.34, .44, .54]) {
          rect(.38, y, .24, .04, _white, .02);
        }
        circle(.66, .68, .1, _gold);
    }
  }

  @override
  bool shouldRepaint(_EmblemPainter old) => old.emblem != emblem;
}

/// The SANAD wordmark: a teal tile with the Arabic letter س beside the name.
class SanadWordmark extends StatelessWidget {
  const SanadWordmark({super.key, this.size = 30, this.name = 'SANAD', this.light = false});

  /// Height of the tile; the name scales with it.
  final double size;
  final String name;

  /// White name, for dark backgrounds.
  final bool light;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: light ? Colors.white : SanadColors.primary,
              borderRadius: BorderRadius.circular(size * .27),
            ),
            child: Text('س',
                style: TextStyle(
                    color: light ? SanadColors.primary : Colors.white,
                    fontSize: size * .6,
                    fontWeight: FontWeight.w700,
                    height: 1.1)),
          ),
          SizedBox(width: size * .27),
          Text(name,
              style: TextStyle(
                  color: light ? Colors.white : SanadColors.primary,
                  fontSize: size * .67,
                  fontWeight: FontWeight.w700,
                  letterSpacing: size * .067)),
        ],
      );
}
