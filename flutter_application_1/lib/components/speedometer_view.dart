import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';

class SpeedoMeterView extends StatelessWidget {
  final double radius;
  final double startAngle;
  final double endAngle;
  final double speed;

  const SpeedoMeterView({super.key, 
    required this.radius,
    required this.startAngle,
    required this.endAngle,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CustomPaint(
        painter: RadialGaugePainter(
          radius: radius,
          startAngle: startAngle,
          endAngle: endAngle,
          speed: speed,
        ),
      ),
    );
  }
}

class RadialGaugePainter extends CustomPainter {
  final double radius;
  final double startAngle;
  final double endAngle;
  final double speed;
  final int majorTickInterval = 20;
  final int minorTicksPerInterval = 5;

  RadialGaugePainter({
    required this.radius,
    required this.startAngle,
    required this.endAngle,
    required this.speed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 8.0;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double circleRadius = (radius - strokeWidth / 2);

    final Paint arcPaint = Paint()
      ..color = ColorUtils.appLightGrey
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Paint circlePaint = Paint()
      ..color = ColorUtils.appLightGrey
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Paint majorTickPaint = Paint()
      ..color = ColorUtils.appLightGrey
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Paint minorTickPaint = Paint()
      ..color = ColorUtils.appLightGrey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final Paint colorPaint = Paint()
      ..color = ColorUtils.appGreen
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Paint colorTickPaint = Paint()
      ..color = ColorUtils.appGreen
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final TextPainter speedTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final TextPainter kmhTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final startAngleCal = 135 - startAngle;

    // Convert speed to angle
    final double speedAngle = (speed / 180) * pi;

    // Draw partial circle with color based on speed
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: circleRadius,
      ),
      _degreesToRadians(startAngleCal),
      speedAngle,
      false,
      colorPaint,
    );

    // Draw remaining part of the circle with original color
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: circleRadius,
      ),
      _degreesToRadians(startAngleCal + speed),
      _degreesToRadians(endAngle - startAngle - speed),
      false,
      arcPaint,
    );

    // Draw circle outline
    canvas.drawCircle(
      Offset(centerX, centerY + radius * 0.2),
      circleRadius * 0.35,
      circlePaint,
    );

    speedTextPainter.text = TextSpan(
      text: '$speed',
      style: TextStyle(color: ColorUtils.appWhite, fontSize: radius * 0.16),
    );
    speedTextPainter.layout();
    speedTextPainter.paint(
      canvas,
      Offset(centerX - speedTextPainter.width / 2, centerY - speedTextPainter.height + radius * 0.2),
    );

    kmhTextPainter.text = TextSpan(
      text: 'Km/h',
      style: TextStyle(color: ColorUtils.appLightGrey, fontSize: radius * 0.16),
    );
    kmhTextPainter.layout();
    kmhTextPainter.paint(
      canvas,
      Offset(centerX - kmhTextPainter.width / 2, centerY - kmhTextPainter.height / 2 + radius * 0.2 + 20),
    );

    // Draw ticks and labels
    final double totalAngle = endAngle - startAngle;
    final double majorTickIntervalInCircle = endAngle / 8.0;
    final double angleStep =
        _degreesToRadians(majorTickIntervalInCircle.toDouble());
    final int totalMajorTicks = (totalAngle / majorTickIntervalInCircle).ceil();
    for (int i = 0; i <= totalMajorTicks; i++) {
      final double angle = _degreesToRadians(startAngleCal) + i * angleStep;
      final double startX = centerX + circleRadius * cos(angle);
      final double startY = centerY + circleRadius * sin(angle);
      final double endX = centerX + (radius * 0.8) * cos(angle);
      final double endY = centerY + (radius * 0.8) * sin(angle);

      // Determine if tick should be colored based on speed
      final bool isSpeedTick = startX < centerX + speed * sin(speed);

      // Draw major ticks
      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        isSpeedTick ? colorTickPaint : majorTickPaint,
      );

      // Add text at major tick intervals within the circle's circumference
      final int labelText = (i + 1) * majorTickInterval;
      final double textX = centerX + (radius * 0.65) * cos(angle);
      final double textY = centerY + (radius * 0.65) * sin(angle);
      if (_isWithinCircle(
        textX,
        textY,
        centerX,
        centerY,
        circleRadius,
      )) {
        textPainter.text = TextSpan(
          text: '$labelText',
          style: TextStyle(color: ColorUtils.appWhite, fontSize: 24.0),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
            textX - textPainter.width / 2,
            textY - textPainter.height / 2,
          ),
        );
      }

      // Draw minor ticks between major ticks
      if (i < totalMajorTicks) {
        final double minorAngleStep = angleStep / minorTicksPerInterval;
        for (int j = 0; j < minorTicksPerInterval; j++) {
          final double minorAngle = angle + j * minorAngleStep;
          final double minorStartX = centerX + circleRadius * cos(minorAngle);
          final double minorStartY = centerY + circleRadius * sin(minorAngle);
          final double minorEndX = centerX + (radius * 0.9) * cos(minorAngle);
          final double minorEndY = centerY + (radius * 0.9) * sin(minorAngle);

          final speedAngleCal = centerX + circleRadius * sin(speed);

          final bool isSpeedMinorTick = minorStartX < speedAngleCal;

          // Draw minor ticks with appropriate color based on speed
          canvas.drawLine(
            Offset(minorStartX, minorStartY),
            Offset(minorEndX, minorEndY),
            isSpeedMinorTick ? colorTickPaint : minorTickPaint,
          );
        }
      }
    }
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  bool _isWithinCircle(
    double x,
    double y,
    double centerX,
    double centerY,
    double radius,
  ) {
    final double dx = x - centerX;
    final double dy = y - centerY;
    return dx * dx + dy * dy <= radius * radius;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
