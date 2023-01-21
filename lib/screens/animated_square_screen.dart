import 'package:flutter/material.dart';

class AnimatedSquareScreen   extends StatelessWidget {
  const AnimatedSquareScreen  ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _AnimatedSquare(),
      ),
    );
  }
} 

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> moveBottom;
  late Animation<double> moveRight;
  late Animation<double> moveLeft;
  late Animation<double> moveTop;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 4500 )
    );

    moveRight = Tween( begin: 0.0, end: 100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut))
    );

    moveTop = Tween( begin: 0.0, end: -100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut))
    );

    moveLeft = Tween( begin: 0.0, end: -100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut))
    );

    moveBottom = Tween( begin: 0.0, end: 100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut))
    );

    controller.addListener(() {
      
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }

    });
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
      builder: ((context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value + moveLeft.value, moveTop.value + moveBottom.value),
          child: child
        );
      }),
      child: const _Rectangle(),
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