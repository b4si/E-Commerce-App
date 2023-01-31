import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/services/checkout_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutProvider with ChangeNotifier {
  Future<void> chekoutNotifier(context) async {
    await placeOrder(context);
    Provider.of<CartProvider>(context, listen: false)
        .mainCartList
        .value
        .clear();
    notifyListeners();
  }
}
