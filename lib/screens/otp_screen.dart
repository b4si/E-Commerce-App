// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class OtpScreen extends StatelessWidget {
  String email;
  OtpScreen({super.key, required this.email});

  final _formKey = GlobalKey<FormState>();

  TextEditingController otpController = TextEditingController();
  postOtp(context) async {
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
      var response = await Dio().post(
        ('http://10.0.2.2:3000/verifyOtp'),
        data: {
          "otp": otpController.text,
          "userEmail": email,
        },
      ).timeout(
        const Duration(seconds: 15),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Succesfully Registered'),
          ),
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      }
    } on SocketException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => const Center(
            child: AlertDialog(
          content: Text('No internet connection'),
        )),
      );
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
      if (e.response!.statusCode == 401) {
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
            content: const Text('Invalid OTP'),
          ),
        );
      }
      if (e.response!.statusCode == 403) {
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
            content: const Text('OTP Expired'),
          ),
        );
      }
    } catch (err) {
      log(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please check your e-mail for otp verification',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter OTP';
                    }
                    return null;
                  },
                  controller: otpController,
                  maxLength: 4,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    postOtp(context);
                  }
                },
                // onTap: () =>
                //  Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => LoginScreen(),
                //   ),
                // ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
