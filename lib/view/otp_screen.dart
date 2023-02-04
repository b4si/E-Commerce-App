// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/controller/provider/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  String email;
  OtpScreen({super.key, required this.email});

  final _formKey = GlobalKey<FormState>();

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
              child: Consumer<OtpProvider>(
                builder: (context, value, child) => Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter OTP';
                      }
                      return null;
                    },
                    controller: value.otpController,
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
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Consumer<OtpProvider>(
                builder: (context, value, child) => GestureDetector(
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
                      value.postOtp(context, email);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
