import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class TwitterSplashScreen extends StatefulWidget {
  const TwitterSplashScreen({ Key? key }) : super(key: key);

  @override
  State<TwitterSplashScreen> createState() => _TwitterSplashScreenState();
}

class _TwitterSplashScreenState extends State<TwitterSplashScreen> {

  bool activated = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          from: 30,
          animate: activated,
          duration: const Duration( seconds: 1 ),
          child: const FaIcon( FontAwesomeIcons.twitter, color: Colors.white, size: 40 )
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activated = true;
          });
        },
        backgroundColor: Colors.purple,
        child: const FaIcon( FontAwesomeIcons.play, color: Colors.white ),
      ),
    );
  }
}