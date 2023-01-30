import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:designs/screens/screens.dart';
import 'package:designs/theme/theme.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => ThemeChanger(1),
    child: const MyApp()
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<ThemeChanger>(context, listen: true);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light
    );

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeChanger.currentTheme,
      initialRoute: 'launcher',
      routes: {
        'animated_square' : ( _ ) => const AnimatedSquareScreen(),
        'twitter_splash'  : ( _ ) => const TwitterSplashScreen(),
        'scroll_design'   : ( _ ) => const ScrollDesignScreen(),
        'circle_graphs'   : ( _ ) => const CircleGraphsScreen(),
        'basic_design'    : ( _ ) => const BasicDesignScreen(),
        'sliver_list'     : ( _ ) => const SliverListScreen(),
        'notifications'   : ( _ ) => const NavigationScreen(),
        'animations'      : ( _ ) => const AnimationsScreen(),
        'animate_do'      : ( _ ) => const AnimateDoScreen(),
        'slideshows'      : ( _ ) => const SlideShowScreen(),
        'emergency'       : ( _ ) => const EmergencyScreen(),
        'pinterest'       : ( _ ) => const PinterestScreen(),
        'launcher'        : ( _ ) => const LauncherScreen(),
        'headers'         : ( _ ) => const HeadersScreen(),
        'home'            : ( _ ) => const HomeScreen(),
      },
    );
  }
}

