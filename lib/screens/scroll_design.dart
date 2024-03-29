import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScrollDesignScreen extends StatelessWidget {
  const ScrollDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5],
            colors: [
              Color(0xff7AECCA),
              Color(0xff50C2DD)
            ]
          )
        ),
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: const [
            Screen1(),
            Screen2(),
          ]
        ),
      )
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [

        BackgroundWidget(),

        MainContentWidget()

      ]
    );
  }
}

class MainContentWidget extends StatelessWidget {
  const MainContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: Colors.white);
  
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('11º', style: textStyle),
            Text(DateFormat('EEEE').format(DateTime.now()), style: textStyle),
            Expanded(child: Container()),
            const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white)
          ],
        ),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff50C2DD),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(image: AssetImage('assets/scroll-1.png'))
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff50C2DD),
      child: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, 'home'),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff0098FA),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            shape: const StadiumBorder()
          ),
          child: const Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 30)),
        )
      )
    );
  }
}
