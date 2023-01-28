

import 'package:flutter/material.dart';

import 'package:designs/widgets/widgets.dart';

class CircleGraphsScreen extends StatefulWidget {
  const CircleGraphsScreen({super.key});

  @override
  State<CircleGraphsScreen> createState() => _CircleGraphsScreenState();
}

class _CircleGraphsScreenState extends State<CircleGraphsScreen> {

  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomCircleProgress(percentage: percentage, primaryColor: Colors.blue),
              _CustomCircleProgress(percentage: percentage, primaryColor: Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomCircleProgress(percentage: percentage, primaryColor: Colors.purple),
              _CustomCircleProgress(percentage: percentage, primaryColor: Colors.orange),
            ],
          ),
        ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percentage += 10;
          if (percentage > 100) percentage = 0;

          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: const Icon( Icons.refresh ),
      ),
    );
  }
}

class _CustomCircleProgress extends StatelessWidget {

  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryLineWidth;
  final double secondaryLineWidth;

  const _CustomCircleProgress({
    Key? key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryLineWidth = 10,
    this.secondaryLineWidth = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: CircularProgress(
        percentage: percentage,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        primaryLineWidth: primaryLineWidth,
        secondaryLineWidth: secondaryLineWidth,
      ),
    );
  }
}