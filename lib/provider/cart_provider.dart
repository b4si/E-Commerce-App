// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/cart_model/cart_list.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  bool isButtonEnabled = false;

  ValueNotifier<List<CartList>> mainCartList = ValueNotifier([]);

  final dio = Dio();

  var grandtotal;
  var subTotal;
  var shipping;
  var total;

  checkingButton() {
    if (mainCartList.value.isEmpty) return;
    for (int i = 0; i < mainCartList.value.length; i++) {
      if (mainCartList.value[i].itemQuantity <= 1) {
        log(mainCartList.value[i].itemQuantity.toString());
        isButtonEnabled = false;
        notifyListeners();
      } else {
        isButtonEnabled = true;
        notifyListeners();
      }
    }
    mainCartList.notifyListeners();
  }

  Future<void> cartIncrement(productId) async {
    try {
      Response response = await dio
          .post('$baseUrl/itemInc/$productId/${emailIds['user']['_id']}');
      mainCartList.notifyListeners();
      cartPreview();
      notifyListeners();
      checkingButton();
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> cartDecrement(context, productId) async {
    try {
      Response response = await dio
          .post('$baseUrl/itemDec/$productId/${emailIds['user']['_id']}');
      mainCartList.notifyListeners();
      cartPreview();
      notifyListeners();
      checkingButton();
      // log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> cartPreview() async {
    try {
      Response response =
          await dio.get('$baseUrl/cart/${emailIds['user']['_id']}');
      final cartItems = CartModel.fromJson(response.data);
      mainCartList.value.clear();
      mainCartList.value.addAll(cartItems.cartList.reversed);
      grandtotal = cartItems.grandtotal;
      subTotal = cartItems.subtotal;
      shipping = cartItems.shipping;
      total = cartItems.total;
      mainCartList.notifyListeners();
      notifyListeners();
      checkingButton();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteItem(productId) async {
    try {
      Response response = await dio
          .put('$baseUrl/itemDelete/$productId/${emailIds['user']['_id']}');
      log(response.data.toString());
      mainCartList.value
          .removeWhere((element) => element.product[0].id == productId);
      mainCartList.notifyListeners();
      notifyListeners();
      checkingButton();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addToCart(context, productId) async {
    try {
      Response response = await dio.get(
        '$baseUrl$addToCartUrl$productId/${emailIds['user']['_id']}',
      );

      if (response.statusCode == 200) {
        mainCartList.notifyListeners();
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
