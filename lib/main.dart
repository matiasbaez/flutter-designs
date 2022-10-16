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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'basic_design': ( _ ) => const BasicDesignScreen(),
        'scroll_design': ( _ ) => const ScrollDesignScreen(),
        'home': ( _ ) => const HomeScreen(),
      },
    );
  }
}

