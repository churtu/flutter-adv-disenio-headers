import 'package:flutter/material.dart';
import 'package:adv_disenios/src/pages/pages.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideShowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget currentPage){
    _currentPage = currentPage;
    notifyListeners();
  }
}