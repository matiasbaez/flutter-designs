
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:designs/widgets/widgets.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Slideshow(
            dotsUp: false,
            primaryBullet: 20,
            primaryColor: Colors.orange,
            slides: [
              SvgPicture.asset('assets/svgs/slide-1.svg'),
              SvgPicture.asset('assets/svgs/slide-2.svg'),
              SvgPicture.asset('assets/svgs/slide-3.svg'),
              SvgPicture.asset('assets/svgs/slide-4.svg'),
              SvgPicture.asset('assets/svgs/slide-5.svg')
            ]
          )),

          Expanded(child: Slideshow(
            slides: [
              SvgPicture.asset('assets/svgs/slide-3.svg'),
              SvgPicture.asset('assets/svgs/slide-4.svg'),
              SvgPicture.asset('assets/svgs/slide-5.svg')
            ]
          )),
        ]
      )
    );
  }
}