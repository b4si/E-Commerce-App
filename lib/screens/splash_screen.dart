// ignore_for_file: must_be_immutable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  bool isLoggedIn;

  SplashScreen({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: const Text(
        'COZA STORE',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      nextScreen: isLoggedIn ? HomeScreen() : const LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
