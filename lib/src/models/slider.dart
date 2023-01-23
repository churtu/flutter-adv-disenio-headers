
import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier{
  double _currentPageIndex = 0;

  double get currentPageIndex => _currentPageIndex;

  set currentPageIndex(double currentPageIndex) {
    _currentPageIndex = currentPageIndex;
    notifyListeners();
  }
}