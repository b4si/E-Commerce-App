import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/screens/profile_address_screen.dart';
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
      backgroundColor: Colors.grey.shade100,
      body: Consumer<ProfileScreenProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SizedBox(
                        //   width: size.width * 0.05,
                        // ),
                        CircleAvatar(
                          radius: size.height * 0.06,
                          backgroundColor: Colors.grey.shade400,
                          // backgroundImage: const NetworkImage(
                          // ),
                        ),
                        // SizedBox(
                        //   width: size.width * 0.09,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            emailIds.isEmpty
                                ? Shimmer.fromColors(
                                    baseColor: Colors.grey.shade400,
                                    highlightColor: Colors.grey.shade300,
                                    child: Container(
                                      width: size.width * 0.4,
                                      height: size.height * 0.02,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey),
                                    ),
                                  )
                                : Text(
                                    emailIds['user']['email'],
                                  ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.penToSquare,
                              size: 20,
                              color: Colors.teal,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.boxOpen,
                            color: Colors.teal,
                          ),
                          title: const Text(
                            "Order Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.addressBook,
                            color: Colors.teal,
                          ),
                          title: const Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ProfileAddressScreen(),
                            ));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.fileLines,
                            color: Colors.teal,
                          ),
                          title: const Text(
                            "Terms and Conditions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.exclamation,
                            color: Colors.teal,
                          ),
                          title: const Text(
                            "About Us",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListTile(
                      leading: const Icon(
                        FontAwesomeIcons.powerOff,
                        color: Colors.red,
                      ),
                      title: const Text(
                        "Log Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
