import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileScreenProvider>(context, listen: false)
        .initialFunction();
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
                builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.addressList.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                          value: value.addressList[index],
                          groupValue: value.tempAddress,
                          onChanged: (val) {
                            value.assignAddress(value.addressList[index]);
                          }),
                      SizedBox(
                        width: size.width * 0.8,
                        child: Card(
                          elevation: 10,
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        value.deleteAddressNotifier(context,
                                            value.addressList[index].id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    child: Text(
                                      value.addressList.isEmpty
                                          ? '-------'
                                          : '${value.addressList[index].houseNo}, ${value.addressList[index].street}, ',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${value.addressList[index].district}, ${value.addressList[index].state}, ',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    child: Text(
                                      ' ${value.addressList[index].pincode}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              height: size.height * 0.08,
              child: TextButton(
                  onPressed: () {
                    Provider.of<ProfileScreenProvider>(context, listen: false)
                        .showAddress(context);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Deliver to this Address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
