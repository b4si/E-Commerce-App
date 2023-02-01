import 'dart:developer';

import 'package:e_commerce_app/controller/services/order_srevices.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<dynamic>? orderDataList = [];

  var addressList;

  Future getOrderDetails(context) async {
    final tempOrderData = await OrderServices().orderSuccess(context);
    orderDataList!.clear();
    // if (orderDataList.isEmpty) {
    //   Center(
    //     child: CircularProgressIndicator(
    //       strokeWidth: 5,
    //     ),
    // );
    // }
    orderDataList!.add(tempOrderData.orderData.first);
    log(orderDataList![0].address.email.toString());
    notifyListeners();
  }

  void deleteAddressNotifier(BuildContext context, id) {}
}
