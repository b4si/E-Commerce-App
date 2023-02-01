import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/links/url.dart';
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
}
