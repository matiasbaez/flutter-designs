
import 'package:flutter/material.dart';

import 'package:designs/screens/screens.dart';

class LayoutModel with ChangeNotifier {

  Widget _currentPage = SlideShowScreen();

  set currentPage( Widget page ) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;

}