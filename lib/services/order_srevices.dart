import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/url.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/models/order_success_model.dart';
import 'package:e_commerce_app/models/user_model.dart';

class OrderServices {
  Future orderSuccess(context) async {
    try {
      Response response =
          await Dio().get("$baseUrl/orderSuccess/${emailIds['user']['_id']}");
      if (response.statusCode == 200) {
        final getData = OrderSuccesModel.fromJson(response.data);
        // List responseToSend = getData;
        // log(getData.toString());
        return getData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future viewOrder(context) async {
    try {
      Response response =
          await Dio().get("$baseUrl/viewOrders/${emailIds['user']['_id']}");
      final dataToSend = OrderModel.fromJson(response.data);
      OrderModel listToSend = dataToSend;
      return listToSend;
    } catch (e) {
      log(e.toString());
    }
  }

  Future orderDetails(context, checkoutId) async {
    try {
      Map data = {"cartId": checkoutId};
      Response response =
          await Dio().post("$baseUrl/orderedProducts", data: data);
      // final dataToSend = OrderDetailsModel.fromJson(response.data);
      // List listToSend = dataToSend.product;
      // log(response.data.toString());
      return response.data;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
