import 'package:e_commerce_app/services/add_address_services.dart';
import 'package:flutter/material.dart';

class AddAddressProvider with ChangeNotifier {
  TextEditingController houseNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  Future addAddressNotifier(context) async {
    await AddaddressServices().postAddress(context);
    notifyListeners();
  }
}
