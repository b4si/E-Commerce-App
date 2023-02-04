import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/view/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileAddressScreen extends StatelessWidget {
  const ProfileAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          Provider.of<ProfileScreenProvider>(context, listen: false)
                  .addressList
                  .isEmpty
              ? Colors.white
              : Colors.grey.shade100,
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
              padding: const EdgeInsets.all(10.0),
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
              return value.addressList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage('assets\\No address.jpg'),
                        ),
                        Text(
                          'Please add the Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: value.addressList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
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
                        );
                      });
            }),
          ),
        ],
      ),
    );
  }
}
