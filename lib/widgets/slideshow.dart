
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;

  final double secondaryBullet;
  final double primaryBullet;
  final Color secondaryColor;
  final Color primaryColor;
  final bool dotsUp;

  const Slideshow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.primaryBullet = 15,
    this.secondaryBullet = 12,
    this.primaryColor = Colors.pink,
    this.secondaryColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: Center(
        child: Builder(
          builder:(context) {
            final _SliderModel sliderModel = Provider.of<_SliderModel>(context);
            sliderModel.secondaryBullet = secondaryBullet;
            sliderModel.secondaryColor = secondaryColor;
            sliderModel.primaryBullet = primaryBullet;
            sliderModel.primaryColor = primaryColor;

            return Column(
              children: [
                if (dotsUp) _Dots( amount: slides.length ),
                Expanded(child: _Slides( slides: slides )),
                if (!dotsUp) _Dots( amount: slides.length )
              ]
            );
          },
        )
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({super.key, required this.slides});

  @override
  State<_Slides> createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final PageController pageViewController = PageController();

  @override
  void initState() {

    pageViewController.addListener(() {

      final _SliderModel sliderModel = Provider.of<_SliderModel>(context, listen: false);
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
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide({
    Key? key, required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide
    );
  }
}

class _Dots extends StatelessWidget {

  final int amount;

  const _Dots({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(amount, (index) => _Dot(index: index))
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

    final _SliderModel sliderModel = Provider.of<_SliderModel>(context);
    final double secondaryBullet = sliderModel.secondaryBullet;
    final double primaryBullet = sliderModel.primaryBullet;
    final Color secondaryColor = sliderModel.secondaryColor;
    final Color primaryColor = sliderModel.primaryColor;

    final pageViewIndex = sliderModel.currentPage;
    final activeBullet = (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5);
    final bulletSize = activeBullet ? primaryBullet : secondaryBullet;

    return AnimatedContainer(
      width: bulletSize,
      height: bulletSize,
      duration: const Duration( milliseconds: 200 ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: activeBullet ? primaryColor : secondaryColor,
        shape: BoxShape.circle
      ),
    );
  }
}

class _SliderModel with ChangeNotifier {

  double _currentPage = 0;
  double _primaryBullet = 15;
  double _secondaryBullet = 12;
  Color _primaryColor = Colors.pink;
  Color _secondaryColor = Colors.grey;

  double get currentPage => _currentPage;
  double get primaryBullet => _primaryBullet;
  double get secondaryBullet => _secondaryBullet;

  Color get primaryColor => _primaryColor;

  Color get secondaryColor => _secondaryColor;

  set currentPage( double currentPage ) {
    _currentPage = currentPage;
    notifyListeners();
  }

  set primaryBullet( double primaryBullet ) {
    _primaryBullet = primaryBullet;
  }

  set secondaryBullet( double secondaryBullet ) {
    _secondaryBullet = secondaryBullet;
  }

  set primaryColor( Color primaryColor ) {
    _primaryColor = primaryColor;
  }

  set secondaryColor( Color secondaryColor ) {
    _secondaryColor = secondaryColor;
  }

}
