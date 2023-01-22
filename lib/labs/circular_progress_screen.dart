
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({ Key? key }) : super(key: key);

  @override
  _CircularProgressScreenState createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> with SingleTickerProviderStateMixin {

  late final AnimationController controller;
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    controller.addListener(() {
      
      percentage = lerpDouble(percentage, newPercentage, controller.value) ?? 0;
      setState(() {});

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(5),
          child: CustomPaint(
            painter: _CircularProgress( percentage ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }

          controller.forward( from: 0.0 );

          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: const Icon( Icons.refresh ),
      ),
    );
  }
}

class _CircularProgress extends CustomPainter {

  final percentage;

  _CircularProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {

    // Circle
    final paint = Paint()
      ..strokeWidth = 5
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final halfHeight = size.width / 2;
    final halfWidth = size.width / 2;

    Offset center = Offset(halfWidth, halfHeight);
    double radius = min( halfWidth, halfHeight);

    canvas.drawCircle(center, radius, paint);

    // Arc
    final arcPaint = Paint()
      ..strokeWidth = 10
      ..color       = Colors.blue
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