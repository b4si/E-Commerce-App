import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/orders_screen.dart';
import 'package:e_commerce_app/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.teal[700],
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.068,
                  ),
                  CircleAvatar(
                    radius: 52,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        image: NetworkImage(
                            'https://i2-prod.football.london/incoming/article25783675.ece/ALTERNATES/s615/0_GettyImages-1450108295.jpg'),
                        height: 200,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(emailIds['user']['name']),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(emailIds['user']['email']),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListTile(
                leading: const Icon(FontAwesomeIcons.book),
                title: const Text(
                  'Orders',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: (() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const OrdersScreen()),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListTile(
                leading: const Icon(FontAwesomeIcons.heart),
                title: const Text(
                  'Wishlist',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WishListScreen(),
                  ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListTile(
                leading: const Icon(FontAwesomeIcons.exclamation),
                title: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
