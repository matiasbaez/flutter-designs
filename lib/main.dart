import 'package:flutter/material.dart';

import 'package:designs/screens/screens.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light
    );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'scroll_design',
      routes: {
        'animated_square' : ( _ ) => const AnimatedSquareScreen(),
        'scroll_design'   : ( _ ) => const ScrollDesignScreen(),
        'circle_graphs'   : ( _ ) => const CircleGraphsScreen(),
        'basic_design'    : ( _ ) => const BasicDesignScreen(),
        'animations'      : ( _ ) => const AnimationsScreen(),
        'slideshows'      : ( _ ) => const SlideShowScreen(),
        'emergency'       : ( _ ) => const EmergencyScreen(),
        'pinterest'       : ( _ ) => const PinterestScreen(),
        'headers'         : ( _ ) => const HeadersScreen(),
        'home'            : ( _ ) => const HomeScreen(),
      },
    );
  }
}

