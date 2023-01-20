import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/address_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfileScreenProvider with ChangeNotifier {
  final dio = Dio();

  List<dynamic> addressList = [];

  Future<void> showAddress(context) async {
    try {
      Response response =
          await dio.get('$baseUrl/userProfile/${emailIds['user']['_id']}');
      // log(response.data.toString());
      final addresses = AddressModel.fromJson(
        response.data,
      );
      log(addresses.toString());
      addressList.clear();
      addressList.addAll(addresses.address.reversed);
      notifyListeners();
      log(addressList[0].state);
    } catch (e) {
      log(e.toString());
    }
  }
}
