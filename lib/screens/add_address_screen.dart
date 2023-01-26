import 'package:e_commerce_app/controller/provider/add_address_provider.dart';
import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/controller/services/add_address_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
      ),
      body: SingleChildScrollView(
        child: Consumer<AddAddressProvider>(
          builder: (context, value, child) => Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Please provide Your Address',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: value.houseNoController,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the House No';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'House No',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: value.streetController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Street';
                    }
                    // if (!EmailValidator.validate(value)) {
                    //   return 'Please enter a valid e-mail';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Street',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: value.districtController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your District';
                    }
                    // if (!EmailValidator.validate(value)) {
                    //   return 'Please enter a valid e-mail';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'District',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: value.stateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your State';
                    }
                    // if (!EmailValidator.validate(value)) {
                    //   return 'Please enter a valid e-mail';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'State',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: value.pincodeController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your pincode';
                    } else if (value.length > 7) {
                      return 'Please enter a valid Pincode';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Pincode',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      postAddress(context)
                          .whenComplete(
                            () => clearField(context),
                          )
                          .whenComplete(
                              () => Provider.of<ProfileScreenProvider>(
                                    context,
                                    listen: false,
                                  ).showAddress(context))
                          .whenComplete(
                            () => Navigator.of(context).pop(),
                          );
                    }
                  },
                  child: const Text('Add Address'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  clearField(context) async {
    final provider = Provider.of<AddAddressProvider>(context, listen: false);
    provider.houseNoController.clear();
    provider.streetController.clear();
    provider.districtController.clear();
    provider.stateController.clear();
    provider.pincodeController.clear();
  }
}
