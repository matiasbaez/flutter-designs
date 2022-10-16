
import 'package:flutter/material.dart';

import 'package:designs/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),

          const HomeBody()
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitleWidget(title: 'Classify transaction', subtitle: 'Classify this transaction into a particular category')
        ]
      ),
    );
  }
}