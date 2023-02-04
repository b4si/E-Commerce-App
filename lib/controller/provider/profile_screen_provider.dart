import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/services/add_address_services.dart';
import 'package:e_commerce_app/models/address_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/services/profile_screen_service.dart';
import 'package:flutter/material.dart';

class ProfileScreenProvider with ChangeNotifier {
  final dio = Dio();

  List<dynamic> addressList = [];

  TextEditingController nameController = TextEditingController();

  Address? tempAddress;
  initialFunction() {
    if (addressList[0] == null) {
      return;
    }
    tempAddress = addressList.first;
  }

  void assignAddress(Address address) {
    tempAddress = address;
    notifyListeners();
  }

  changeNameController() {
    nameController.text = emailIds['user']['name'];
    notifyListeners();
  }

  Future<void> changeName() async {
    await ProfileService().changeName();
    notifyListeners();
  }

  Future<void> showAddress(context) async {
    final addresses = await ProfileService().showAddress(context);
    addressList.clear();
    if (addresses.address.isEmpty) {
      return;
    } else {
      addressList.addAll(addresses.address.reversed);
    }
    notifyListeners();
  }

  Future deleteAddressNotifier(context, addressId) async {
    log(addressId);

    AddaddressServices()
        .deleteAddress(addressId)
        .whenComplete(() => showAddress(context));
    notifyListeners();
  }
}
