import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  FocusNode focusNode = FocusNode();

  requestFocus() async {
    focusNode.requestFocus();
  }
}
