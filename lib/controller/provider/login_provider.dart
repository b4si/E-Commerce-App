import 'dart:async';
import 'package:e_commerce_app/services/login_services.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool passwordVisible = true;

  changeVisibilility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  //Controllers for getting email and password from login screeen ------->

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //function for posting login data --------->

  Future<void> loginToHome(context) async {
    await LoginServices().loginToHome(context);
    notifyListeners();
  }
}
