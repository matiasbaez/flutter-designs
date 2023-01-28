
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:designs/models/slider_model.dart';

class SlideShowScreen extends StatefulWidget {
  const SlideShowScreen({super.key});

  @override
  State<SlideShowScreen> createState() => _SlideShowScreenState();
}

class _SlideShowScreenState extends State<SlideShowScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Expanded(child: _Slides()),
              _Dots()
            ]
          ),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({super.key});

  @override
  State<_Slides> createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final PageController pageViewController = PageController();

  @override
  void initState() {

    pageViewController.addListener(() {

      final SliderModel sliderModel = Provider.of<SliderModel>(context, listen: false);
      sliderModel.currentPage = pageViewController.page ?? 0;

    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: const [
          _Slide(svg: 'assets/svgs/slide-1.svg'),
          _Slide(svg: 'assets/svgs/slide-2.svg'),
          _Slide(svg: 'assets/svgs/slide-3.svg'),
          _Slide(svg: 'assets/svgs/slide-4.svg'),
          _Slide(svg: 'assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide({
    Key? key, required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot( index: 0 ),
          _Dot( index: 1 ),
          _Dot( index: 2 ),
          _Dot( index: 3 ),
          _Dot( index: 4 ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final SliderModel sliderModel = Provider.of<SliderModel>(context);
    final pageViewIndex = sliderModel.currentPage;

    return AnimatedContainer(
      duration: const Duration( milliseconds: 200 ),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) ? Colors.pink : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}