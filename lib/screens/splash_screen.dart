// ignore_for_file: must_be_immutable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  bool isLoggedIn;

  SplashScreen({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedSplashScreen(
      backgroundColor: const Color(0xFF8AE6E3),
      duration: 2000,
      splashIconSize: size.width,
      splash: const Image(
          fit: BoxFit.cover, image: AssetImage('assets\\Gadgeto.png')),
      nextScreen: isLoggedIn ? HomeScreen() : LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
