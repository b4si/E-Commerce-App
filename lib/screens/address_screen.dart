import 'dart:developer';

import 'package:e_commerce_app/controller/provider/add_address_provider.dart';
import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/controller/services/add_address_services.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Choose the address'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.08,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddAddressScreen(),
                    ));
                  },
                  child: const Text(
                    '+ Add a new Address',
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ),
          Expanded(
            child: Consumer<ProfileScreenProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.addressList.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                          value: value.addressList[index],
                          groupValue: value.address,
                          onChanged: (val) {
                            value.assignAddress(value.addressList[index]);
                          }),
                      Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.9),
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value.addressList.isEmpty
                                        ? "Add Your Address"
                                        : emailIds['user']['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        log(value.addressList[index].id);

                                        value.deleteAddressNotifier(context,
                                            value.addressList[index].id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                value.addressList.isEmpty
                                    ? '-------'
                                    : '${value.addressList[index].houseNo}, ${value.addressList[index].street}, ${value.addressList[index].district}, ${value.addressList[index].state}, ${value.addressList[index].pincode}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Deliver to this Address'))
        ],
      ),
    );
  }
}
