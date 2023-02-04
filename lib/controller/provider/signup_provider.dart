import 'dart:async';
import 'package:e_commerce_app/services/signup_services.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  //Controllers for getting fields in sign up screen------->

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //Function for posting sign up data --------->

  Future<void> postData(context) async {
    await SignupServices().postData(context);
    notifyListeners();
  }

  
}
