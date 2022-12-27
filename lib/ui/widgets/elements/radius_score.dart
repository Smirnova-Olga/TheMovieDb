import 'dart:math';
import 'package:flutter/material.dart';

class RadiusScoreWidget extends StatelessWidget {
  final Widget child;
  final double percent;

  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  const RadiusScoreWidget({
    super.key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      CustomPaint(
          painter: MyPainter(
        percent: percent,
        fillColor: fillColor,
        lineColor: lineColor,
        freeColor: freeColor,
        lineWidth: lineWidth,
      )),
      Padding(
        padding: const EdgeInsets.all(5.5),
        child: Center(child: child),
      ),
    ]);
  }
}

class MyPainter extends CustomPainter {
  final double percent;

  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Rect arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFelledArc(canvas, arcRect);
  }

  void drawFelledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = lineColor;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = freeColor;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = fillColor;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    const linesMargin = 3;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
