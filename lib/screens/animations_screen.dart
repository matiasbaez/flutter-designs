
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: AnimatedRectangle()
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  const AnimatedRectangle({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedRectangle> createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> moveRight;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 4000 )
    );


    rotation = Tween( begin: 0.0, end: 2 * math.pi ).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut)
    );

    opacity = Tween( begin: 0.1, end: 1.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 1))
    );

    moveRight = Tween( begin: 0.0, end: 150.0 ).animate(controller);

    scale = Tween( begin: 1.0, end: 2.0 ).animate(controller);

    controller.addListener(() {
      
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }

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

    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: const _Rectangle(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: scale.value,
                child: child,
              ),
            )
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}