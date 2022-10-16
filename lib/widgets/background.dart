
import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({super.key});

  final BoxDecoration? boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8],
      colors: [
        Color(0xff2E305F),
        Color(0xff202333)
      ]
    )
  );

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(decoration: boxDecoration),

        Positioned(
          top: -100,
          left: -25,
          child: PinkBoxWidget()
        )
      ]
    );
  }
}

class PinkBoxWidget extends StatelessWidget {
  const PinkBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ]
          )
        ),
      ),
    );
  }
}