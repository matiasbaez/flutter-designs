
import 'package:designs/screens/twitter_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:designs/screens/screens.dart';

class AnimateDoScreen extends StatelessWidget {
  const AnimateDoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Animate do'),
        backgroundColor: Colors.blue,
        actions: [

          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) => const TwitterSplashScreen()
              ));
            },
            icon: const FaIcon( FontAwesomeIcons.twitter )
          ),

          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) => const HomeScreen()
              ));
            },
            icon: const FaIcon( FontAwesomeIcons.chevronRight )
          )
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: const Duration( milliseconds: 1100 ),
              child: const Icon( Icons.new_releases, color: Colors.blue, size: 40 )
            ),

            FadeInDown(
              delay: const Duration( milliseconds: 250 ),
              child: const Text('Title', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w200, color: Colors.black ) )
            ),

            FadeInDown(
              delay: const Duration( milliseconds: 800 ),
              child: const Text('Subtitulo del body', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black ) )
            ),

            FadeInLeft(
              delay: const Duration( milliseconds: 1100 ),
              child: Container(
                width: 200,
                height: 2,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const FaIcon( FontAwesomeIcons.play, color: Colors.white ),
        ),
      ),
    );
  }
}