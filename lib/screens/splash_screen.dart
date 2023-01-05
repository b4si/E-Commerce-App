import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: const Text(
        'COZA STORE',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
