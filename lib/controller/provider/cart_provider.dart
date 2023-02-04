// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/models/cart_model/cart_list.dart';
import 'package:e_commerce_app/services/cart_services.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  ValueNotifier<List<CartList>> mainCartList = ValueNotifier([]);

  final dio = Dio();

  var grandtotal;
  var subTotal;
  var shipping;
  var total;

  // bool isInCart = false;

  bool checkingInCart(id) {
    bool isInCart = false;
    for (int i = 0; i < mainCartList.value.length; i++) {
      if (mainCartList.value[i].product[0].id == id) {
        isInCart = true;
        break;
      }
    }
    return isInCart;
  }

  Future<void> cartIncrement(productId) async {
    await CartServices().cartIncrement(productId);
    cartPreview();
    mainCartList.notifyListeners();
    notifyListeners();
  }

  Future<void> cartDecrement(context, productId) async {
    await CartServices().cartDecrement(context, productId);
    cartPreview();
    mainCartList.notifyListeners();
    notifyListeners();
  }

  Future<void> cartPreview() async {
    final gettedData = await CartServices().cartPreview();
    mainCartList.value.clear();
    if (gettedData.cartList.isEmpty) {
      return;
    } else {
      mainCartList.value.addAll(gettedData.cartList.reversed);
    }

    grandtotal = gettedData.grandtotal;
    subTotal = gettedData.subtotal;
    shipping = gettedData.shipping;
    total = gettedData.total;
    mainCartList.notifyListeners();
    notifyListeners();
  }

  Future<void> deleteItem(productId) async {
    await CartServices().deleteItem(productId);
    mainCartList.value
        .removeWhere((element) => element.product[0].id == productId);
    mainCartList.notifyListeners();
    notifyListeners();
  }

  Future<void> addToCart(context, productId) async {
    await CartServices().addToCart(context, productId);
    notifyListeners();
  }
}
