import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/screens/add_address_screen.dart';
import 'package:e_commerce_app/screens/orders_screen.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: Consumer<ProfileScreenProvider>(
          builder: (context, value, child) => Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
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
                            MaterialStateProperty.all(Colors.lightBlue),
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
                            MaterialStateProperty.all(Colors.lightBlue),
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       border: Border.all(width: 1),
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: const [
              //         Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text(
              //             'Address 2',
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text(
              //             'Alungaparambil House Kattekkadan ,karakunnu p.o 676123',
              //             style: TextStyle(fontSize: 14),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
