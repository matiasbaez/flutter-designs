import 'package:flutter/material.dart';

import 'package:designs/widgets/widgets.dart';

class HeadersScreen extends StatelessWidget {
  const HeadersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WavesGradientHeader(),
    );
  }
}
