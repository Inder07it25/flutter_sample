import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_1/Utilities/color_utils.dart';

class HalfCircleWithIconAndText extends StatelessWidget {
  final double radius;
  final Color color;
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const HalfCircleWithIconAndText({super.key, 
    required this.radius,
    required this.color,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius + 60, // Adjust for icon and text
      child: Stack(
        alignment: Alignment.center,
        children: [
          HalfCircle(radius: radius, color: color),
          Positioned(
            top: radius / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: iconColor,
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HalfCircle extends StatelessWidget {
  final double radius;
  final Color color;

  const HalfCircle({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HalfCirclePainter(radius: radius, fillColor: color, percentage: 30, frameColor: Colors.red),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final double radius;
  final Color fillColor;
  final double percentage;
  final Color frameColor;

  HalfCirclePainter({
    required this.radius,
    required this.fillColor,
    required this.percentage,
    required this.frameColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = fillColor
      ..strokeWidth = radius * 0.5
      ..style = PaintingStyle.stroke;

    final Paint framePaint = Paint()
      ..color = ColorUtils.appGrey
      ..strokeWidth = radius * 0.5
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height;

    final Rect rect = Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

    const startAngle = -pi;
    const sweepAngle = pi;

    canvas.drawArc(rect, startAngle, sweepAngle, false, framePaint);

    final double arcAngle = (2 * pi * percentage) / 100;

    canvas.drawArc(rect, startAngle, arcAngle, false, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HalfCircleWithBorder extends StatelessWidget {
  final double radius;
  final Color borderColor;
  final double borderWidth;

  const HalfCircleWithBorder({super.key, 
    required this.radius,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius),
      painter: HalfCircleBorderPainter(
        radius: radius,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
    );
  }
}

class HalfCircleBorderPainter extends CustomPainter {
  final double radius;
  final Color borderColor;
  final double borderWidth;

  HalfCircleBorderPainter({
    required this.radius,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

      final Paint linepaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height;

    final double innerRadius = radius - 20;

    final Rect outerRect =
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);
    final Rect innerRect = Rect.fromCircle(
        center: Offset(centerX, centerY), radius: innerRadius);

    const startAngle = -pi;
    const sweepAngle = pi;

    canvas.drawArc(outerRect, startAngle, sweepAngle, false, paint);
    canvas.drawArc(innerRect, startAngle, sweepAngle, false, paint);

    final Path path = Path();
    path.moveTo(centerX - innerRadius, centerY);
    path.lineTo(centerX + innerRadius, centerY);

    canvas.drawPath(path, paint);

    // Draw a line connecting the endpoints
    final Offset start = Offset(centerX - radius, centerY);
    final Offset end = Offset(centerX + radius, centerY);
    canvas.drawLine(start, end, linepaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
