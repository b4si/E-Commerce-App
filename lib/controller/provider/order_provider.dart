import 'package:e_commerce_app/services/checkout_services.dart';
import 'package:e_commerce_app/services/order_srevices.dart';
import 'package:e_commerce_app/models/order_details_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<dynamic> orderDataList = [];
  List<dynamic> orderDetails = [];
  // ignore: prefer_typing_uninitialized_variables
  var quantity;

  List<dynamic> productDetails = [];

  Future getOrderDetails(context) async {
    final tempOrderData = await OrderServices().orderSuccess(context);
    orderDataList.clear();
    // if (orderDataList.isEmpty) {
    //   Center(
    //     child: CircularProgressIndicator(
    //       strokeWidth: 5,
    //     ),
    // );
    // }
    if (tempOrderData.orderData.isEmpty) {
      return;
    } else {
      orderDataList.add(tempOrderData.orderData.last);
    }

    // log(orderDataList![0].address.email.toString());
    notifyListeners();
  }

  Future viewOrders(context) async {
    OrderModel gettedData = await OrderServices().viewOrder(context);
    orderDetails.clear();
    orderDetails.addAll(gettedData.orderData);
    // log(orderDetails[0].id);
    notifyListeners();
    // log(orderDetails[0].id);
  }

  Future<void> previewOrderDetails(context, checkoutId) async {
    final gettedData = await OrderServices().orderDetails(context, checkoutId);
    final finalDetails = OrderDetailsModel.fromJson(gettedData);
    productDetails.clear();
    productDetails.addAll(finalDetails.cartList);
    notifyListeners();
  }

  Future<void> cancelOrder(context, checkoutId) async {
    await CheckoutServices().cancelOrder(context, checkoutId);
    notifyListeners();
  }
}
