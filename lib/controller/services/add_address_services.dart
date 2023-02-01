import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/controller/provider/add_address_provider.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddaddressServices {
  final dio = Dio();

  Future postAddress(context) async {
    final provider = Provider.of<AddAddressProvider>(
      context,
      listen: false,
    );
    try {
      Response response = await dio.post(
        '$baseUrl/saveAddress/${emailIds['user']['_id'].toString()}',
        data: {
          "houseNo": provider.houseNoController.text,
          "street": provider.streetController.text,
          "district": provider.districtController.text,
          "state": provider.stateController.text,
          "pincode": provider.pincodeController.text,
        },
      );

      log(response.data.toString());
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
            content: const Text(
              'Address added Successfully',
            ),
          ),
        );
      }
      return response.data;
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
          content: const Text(
            'Check your Internet connection',
          ),
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
          content: const Text('Something went wrong'),
        ),
      );
    } on DioError catch (e) {
      if (e.response == null) {
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
            content: const Text(
              'Check your Internet connection',
            ),
          ),
        );
      }

      if (e.response!.statusCode == 404) {
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
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteAddress(addressId) async {
    try {
      Response response = await dio.delete('$baseUrl/deleteAddress/$addressId');
      log(response.data.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
