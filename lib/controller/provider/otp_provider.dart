import 'dart:async';
import 'package:e_commerce_app/services/otp_services.dart';
import 'package:flutter/material.dart';

class OtpProvider with ChangeNotifier {
  //controller for getting otp from otp screen-------->

  TextEditingController otpController = TextEditingController();

  //Function for posting data from otp screen -------->

  Future<void> postOtp(context, email) async {
    await OtpServices().postOtp(context, email);
    notifyListeners();
  }
}
