import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;

  void navigationChanger(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
