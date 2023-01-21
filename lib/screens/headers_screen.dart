import 'package:flutter/material.dart';

import 'package:designs/widgets/widgets.dart';

class HeadersScreen extends StatelessWidget {
  const HeadersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    late Widget scaffoldChild;

    switch (arguments['type']) {
      case 'square':
        scaffoldChild = const SquareHeader();
        break;
      case 'circle':
        scaffoldChild = const CircleHeader();
        break;
      case 'curve':
        scaffoldChild = const CurveHeader();
        break;
      case 'diagonal':
        scaffoldChild = const DiagonalHeader();
        break;
      case 'triangle':
        scaffoldChild = const TriangleHeader();
        break;
      case 'beak':
        scaffoldChild = const BeakHeader();
        break;
      case 'waves':
        scaffoldChild = const WavesHeader();
        break;
      default:
        scaffoldChild = const TriangleHeader();
        break;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: scaffoldChild
      ),
    );
  }

}
