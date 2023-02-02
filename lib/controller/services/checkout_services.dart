import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/order_success._screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutServices {
  Future placeOrder(context, paymentId, String paymentMod, int amount) async {
    final address =
        Provider.of<ProfileScreenProvider>(context, listen: false).tempAddress;
    try {
      Response response = await Dio().post('$baseUrl/placeOrder', data: {
        "name": emailIds['user']['name'],
        "email": emailIds['user']['email'],
        "mobile": emailIds['user']['mobile'],
        "addressLine":
            "${address!.houseNo}, ${address.street}, ${address.district}, ${address.state}, ${address.pincode}",
        "cartId": Provider.of<CartProvider>(context, listen: false)
            .mainCartList
            .value[0]
            .id,
        "userId": emailIds['user']['_id'],
        "payment": paymentMod,
        "amount": amount
      });
      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: ((context) => OrderSuccessScreen(
                    paymentId: paymentId,
                  )),
            ),
            (route) => false);
      }
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> cancelOrder(context, checkoutId) async {
    try {
      Response response = await Dio().put("$baseUrl/cancelOrder/$checkoutId");
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
