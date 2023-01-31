import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/order_success._screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future placeOrder(context) async {
  try {
    Response response = await Dio().post('$baseUrl/placeOrder', data: {
      "name": emailIds['user']['name'],
      "email": emailIds['user']['email'],
      "mobile": emailIds['user']['mobile'],
      "addressLine": Provider.of<ProfileScreenProvider>(context, listen: false)
          .tempAddress,
      "cartId": Provider.of<CartProvider>(context, listen: false)
          .mainCartList
          .value[0]
          .id,
      "userId": emailIds['user']['_id'],
      "payment": 'cod',
    });
    if (response.statusCode == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: ((context) => const OrderSuccessScreen()),
          ),
          (route) => false);
    }
    log(response.data.toString());
  } catch (e) {
    log(e.toString());
  }
}
