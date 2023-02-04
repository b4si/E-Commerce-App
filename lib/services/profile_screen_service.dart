import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/url.dart';
import 'package:e_commerce_app/models/address_model.dart';
import 'package:e_commerce_app/models/user_model.dart';

class ProfileService {
  final dio = Dio();

  Future changeName() async {
    try {
      Response response = await Dio().put("$baseUrl/updateProfile", data: {
        "name": emailIds['user']['name'],
      });
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future showAddress(context) async {
    try {
      Response response =
          await dio.get('$baseUrl/userProfile/${emailIds['user']['_id']}');
      // log(response.data.toString());
      final addresses = AddressModel.fromJson(
        response.data,
      );
      return addresses;
    } catch (e) {
      log(e.toString());
    }
  }
}
