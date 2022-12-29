// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/provider/home_provider.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/home/widgets.dart';
import 'package:e_commerce_app/screens/item_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('COZA'),
      ),
      body: PageView(
        controller: pageController,
        children: [
          ListView(
            children: const <Widget>[
              BannerContainer(),
              GridviewSection(),
            ],
          ),
          const CartScreenWidget(),
          const WishListScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Consumer<HomeProvider>(
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value.selectedIndex,
          unselectedItemColor: Colors.white38,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.teal,
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.teal,
              icon: Icon(FontAwesomeIcons.cartShopping),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.teal,
              icon: Icon(FontAwesomeIcons.heart),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.teal,
              icon: Icon(FontAwesomeIcons.user),
              label: 'Profile',
            ),
          ],
          onTap: (gettingValue) {
            value.navigationChanger(gettingValue);

            pageController.animateToPage(
              gettingValue,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}

class GridviewSection extends StatelessWidget {
  const GridviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: size.height * 0.30),
      itemCount: 5,
      itemBuilder: (context, index) => GestureDetector(
        child: Card(
          margin: const EdgeInsets.all(5),
          shadowColor: Colors.black,
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.grey[400],
                          )),
                    ],
                  ),
                  Image(
                    image: const NetworkImage(
                        'https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1662443667/Croma%20Assets/Communication/Mobiles/Images/251804_p9fded.png/mxw_2048,f_auto'),
                    height: size.height * 0.15,
                  ),
                  const Text("OnePlus Nord CE"),
                  SizedBox(
                    height: size.height * 0.012,
                  ),
                  const Text(
                    '₹19,000',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const ItemScreen()),
            ),
          );
        },
      ),
    );
  }
}

class BannerContainer extends StatelessWidget {
  const BannerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Image(
        image: const NetworkImage(
            'https://i03.appmifile.com/572_operator_in/19/12/2022/830e5a8177242f31d03708f7b8af03a8.jpg?f=webp'),
        height: size.height * 0.21,
        fit: BoxFit.cover,
      ),
    );
  }
}
