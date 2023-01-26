import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  loginToHome(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 7,
          color: Colors.white,
          backgroundColor: Colors.black54,
        ),
      ),
    );
    try {
      var response = await Dio().post(baseUrl + loginUrl, data: {
        "email": emailController.text,
        "password": passwordController.text,
      }).timeout(
        const Duration(seconds: 15),
      );

      Map<String, dynamic> user = {};

      user.addAll(response.data);

      saveMapToSharedPreferences(user);
      gettingMap();

      log(user.toString());

      //checking the response is success or not-------->

      if (response.statusCode == 200) {
        // log(user[0]["name"].toString());

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
            content: const Text('Login Successfully completed'),
          ),
        );

        //Storing isLogedIn in shared preferences--------->

        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => HomeScreen())),
            (route) => false);
      }

      //Handling network connection error-------->

    } on SocketException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => const Center(
            child: AlertDialog(
          content: Text('No internet connection'),
        )),
      );

      //Handling timeout error---------->

    } on TimeoutException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: AlertDialog(
            content: Text('No internet connection '),
          ),
        ),
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

      //Handling user not found scenario-------->

      if (e.response!.statusCode == 404) {
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
            content: const Text('User not found'),
          ),
        );

        //Handling Wrong password scenario------->

      } else if (e.response!.statusCode == 402) {
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
            content: const Text('Wrong Password'),
          ),
        );

        //Handling not verified user error-------->

      } else if (e.response!.statusCode == 403) {
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
            content: const Text('You are not a verified user'),
          ),
        );
      }
    } catch (err) {
      log(err.toString());
    }
  }
}
