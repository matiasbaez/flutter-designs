
import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {

  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryLineWidth;
  final double secondaryLineWidth;

  const CircularProgress({
    Key? key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryLineWidth = 10,
    this.secondaryLineWidth = 5,
  }) : super(key: key);

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> with SingleTickerProviderStateMixin {

  late final AnimationController controller;
  double prevPercentage = 0.0;

  @override
  void initState() {

    prevPercentage = widget.percentage;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final difference = widget.percentage - prevPercentage;
    prevPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(5),
          child: CustomPaint(
            painter: _CircularProgress(
              (widget.percentage - difference) + (difference * controller.value),
              widget.primaryColor,
              widget.secondaryColor,
              widget.primaryLineWidth,
              widget.secondaryLineWidth
            ),
          ),
        );
      },
    );

  }
}

class _CircularProgress extends CustomPainter {

  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryLineWidth;
  final double secondaryLineWidth;

  _CircularProgress(
    this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.primaryLineWidth,
    this.secondaryLineWidth
  );

  @override
  void paint(Canvas canvas, Size size) {

    // Circle
    final paint = Paint()
      ..strokeWidth = secondaryLineWidth
      ..color       = secondaryColor
      ..style       = PaintingStyle.stroke;

    final halfHeight = size.width / 2;
    final halfWidth = size.width / 2;

    Offset center = Offset(halfWidth, halfHeight);
    double radius = min( halfWidth, halfHeight);

    canvas.drawCircle(center, radius, paint);

    // Arc
    final arcPaint = Paint()
      ..strokeWidth = 10
      ..color       = primaryColor
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;

    double arcAngle = (2 * pi) * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      arcPaint
    );

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
