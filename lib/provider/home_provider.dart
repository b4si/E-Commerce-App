import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;
  int activeIndex = 0;

  List<String> imageList = [
    'https://image01.realme.net/general/20221216/1671203341519.jpg.webp',
    'https://i03.appmifile.com/572_operator_in/19/12/2022/830e5a8177242f31d03708f7b8af03a8.jpg?f=webp',
    'https://www.oneplus.in/content/dam/oasis/page/2022/eu/launch/11/1223/pad.jpg.thumb.webp',
  ];

  void navigationChanger(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  changeBannerIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }
}
