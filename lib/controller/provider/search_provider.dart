import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  FocusNode focusNode = FocusNode();

  void requestFocus() {
    focusNode.requestFocus();
  }
}
