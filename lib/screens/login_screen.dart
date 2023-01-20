// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/provider/login_provider.dart';
import 'package:e_commerce_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Consumer<LoginProvider>(
              builder: (context, value, child) => Form(
                key: _formKey,
                child: Column(
                  children: [
                    Icon(
                      Icons.lock,
                      size: size.width * 0.20,
                      color: Colors.black87,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text(
                      'GADGETO',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'The gadgets you need!',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: value.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the e-mail';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'email',
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
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: value.passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        obscureText: value.passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              value.changeVisibilility();
                            },
                            icon: Icon(
                              value.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          hintText: 'password',
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
                    SizedBox(
                      height: size.height * 0.05,
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
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            value.loginToHome(context);
                            gettingMap();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not a member? ',
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            )),
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
