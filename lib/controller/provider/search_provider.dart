import 'package:e_commerce_app/controller/provider/home_provider.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  FocusNode focusNode = FocusNode();

  void requestFocus() {
    focusNode.requestFocus();
  }
}
