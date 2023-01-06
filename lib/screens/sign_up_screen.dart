// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/provider/signup_provider.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Consumer<SignupProvider>(
              builder: (context, value, child) => Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'GADGETO',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'The gadgets you need!',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text(
                      'Let\'s create a account for you!',
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
                        controller: value.nameController,
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'username',
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
                        controller: value.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an e-mail';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid e-mail';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'e-mail',
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
                        controller: value.numberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a mobile number';
                          } else if (value.length > 10 || value.length < 10) {
                            return 'Please enter a valid mobile number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Mobile number',
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
                        validator: (gettingValue) {
                          if (gettingValue!.isEmpty) {
                            return 'Please enter a password';
                          } else if (gettingValue.length < 6) {
                            return 'Please enter a long password';
                          }

                          if (value.passwordController.text !=
                              value.confirmPasswordController.text) {
                            return '';
                          }

                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
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
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        controller: value.confirmPasswordController,
                        validator: (gettingvalue) {
                          if (gettingvalue!.isEmpty) {
                            return 'Confirm your password';
                          } else if (value.passwordController.text !=
                              value.confirmPasswordController.text) {
                            return 'Entered Passwords are mismatched';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Confirm password',
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
                        obscureText: true,
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
                              'Sign Up',
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
                            value.postData(context);
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
                            'Already a member! ',
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) => LoginScreen()),
                              ),
                            ),
                            child: const Text(
                              'Login',
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
