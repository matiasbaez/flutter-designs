
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:designs/screens/screens.dart';


final pageRoutes = <_Route>[
  _Route( FontAwesomeIcons.slideshare,      'Slideshow',        const SlideShowScreen() ),
  _Route( FontAwesomeIcons.truckMedical,    'Emergency',        const EmergencyScreen() ),
  _Route( FontAwesomeIcons.heading,         'Headers',          const HeadersScreen() ),
  _Route( FontAwesomeIcons.peopleCarryBox,  'Animated Square',  const AnimatedSquareScreen() ),
  _Route( FontAwesomeIcons.circleNotch,     'Circle Graphs',    const CircleGraphsScreen() ),
  _Route( FontAwesomeIcons.pinterest,       'Pinterest',        const PinterestScreen() ),
  _Route( FontAwesomeIcons.mobile,          'Sliver',           const SliverListScreen() ),
];


class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}