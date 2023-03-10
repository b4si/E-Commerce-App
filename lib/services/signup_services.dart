import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/controller/provider/signup_provider.dart';
import 'package:e_commerce_app/core/url.dart';
import 'package:e_commerce_app/view/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupServices {
  postData(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
          child: CircularProgressIndicator(
        strokeWidth: 7,
        color: Colors.white,
        backgroundColor: Colors.black54,
      )),
    );
    try {
      final provider = Provider.of<SignupProvider>(context, listen: false);
      var response = await Dio().post((baseUrl + otpPageUrl), data: {
        "name": provider.nameController.text,
        "email": provider.emailController.text,
        "mobile": provider.numberController.text,
        "password": provider.passwordController.text,
      }).timeout(
        const Duration(seconds: 15),
      );

      //Checking success condition -------->

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return OtpScreen(
                email: provider.emailController.text,
              );
            },
          ),
        );
      }

      //Handling network connection error--------->

    } on SocketException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => const Center(
            child: AlertDialog(
          content: Text('No internet connection'),
        )),
      );

      //Handling timeout error--------->

    } on TimeoutException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => const Center(
            child: AlertDialog(
          content: Text('No internet connection'),
        )),
      );
    } on DioError catch (e) {
      if (e.response == null) {
        Navigator.of(context).pop();
        return showDialog(
          context: context,
          builder: (context) => const Center(
              child: AlertDialog(
            content: Text('No internet connection '),
          )),
        );
      }

      //Handling e-mail already exist error-------->

      if (e.response!.statusCode == 409) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('E-mail or phone number already exist'),
          ),
        );
      }
    } catch (err) {
      log(err.toString());
    }
  }
}
