import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/screens/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileScreenProvider>(context, listen: false)
        .showAddress(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ProfileScreenProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              CircleAvatar(
                radius: size.height * 0.105,
                backgroundImage: const NetworkImage(
                  'https://i2-prod.football.london/incoming/article25783675.ece/ALTERNATES/s615/0_GettyImages-1450108295.jpg',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              emailIds.isEmpty
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.02,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey),
                      ),
                    )
                  : Text(emailIds['user']['name']),
              SizedBox(
                height: size.height * 0.01,
              ),
              emailIds.isEmpty
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: size.width * 0.7,
                        height: size.height * 0.02,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey),
                      ),
                    )
                  : Text(
                      emailIds['user']['email'],
                    ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: size.width * 0.30,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal.shade300),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: ((context) => const OrdersScreen()),
                        //   ),
                        // );
                      },
                      child: const Text(
                        'Order Details',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.30,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal.shade300),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddAddressScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Add Address',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value.addressList.isEmpty
                              ? 'Add Your Address'
                              : 'Address ',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value.addressList.isEmpty
                              ? '-------'
                              : '${value.addressList[0].houseNo}, ${value.addressList[0].street}, ${value.addressList[0].district}, ${value.addressList[0].state}, ${value.addressList[0].pincode}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade200,
                        border: Border.all(
                          width: 1,
                          color: Colors.teal,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: size.width * 0.29,
                      height: size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.settings_outlined,
                            size: 32,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade200,
                        border: Border.all(width: 1, color: Colors.teal),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: size.width * 0.29,
                      height: size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            FontAwesomeIcons.exclamation,
                            size: 30,
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade200,
                        border: Border.all(width: 1, color: Colors.teal),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: size.width * 0.29,
                      height: size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            FontAwesomeIcons.fileLines,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Terms and Conditions',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
