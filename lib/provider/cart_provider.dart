import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final dio = Dio();

  Future<void> addToCart(context, productId) async {
    try {
      Response response = await dio.get(
        '$baseUrl$addToCartUrl$productId/${emailIds['user']['_id']}',
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
            content: const Text('Successfully added to cart'),
          ),
        );
      }
    } on SocketException {
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
          content: const Text('Check Internet connection'),
        ),
      );
    } on TimeoutException {
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
          content: const Text('Check internet connection'),
        ),
      );
    } on DioError catch (err) {
      log(err.error);
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
          content: const Text('Something went wrong'),
        ),
      );
    } catch (e) {
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
          content: const Text('Something went wrong'),
        ),
      );
    }
  }
}
