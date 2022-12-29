// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
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
            children: <Widget>[
              const BannerContainer(),
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
  GridviewSection({
    Key? key,
  }) : super(key: key) {
    _stream = _reference.snapshots();
  }

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('items_list');

  //_reference.get() --> returns Future<QuerySnapshot>
  //_reference.snapshot --> Stream<QuerySnpashot> -- realtime update

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (context, AsyncSnapshot snapshot) {
          //check error ----->

          if (snapshot.hasError) {
            return Center(
              child: Text('Eroor${snapshot.error}'),
            );
          }

          //check if data is arrived ------>

          if (snapshot.hasData) {
            //get data -------->

            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //converting the documents to map -------->

            List<Map> items = documents
                .map((e) => {
                      'id': e['id'],
                      'name': e['name'],
                      'org_price': e['original_price'],
                      'image': e['imageUrl'],
                      'dis_price': e['discounted_price'],
                      'description': e['desciption']
                    })
                .toList();

            //Display the list -------->

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: size.height * 0.30),
              itemCount: items.length,
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
                          SizedBox(
                            width: size.width * 0.32,
                            height: size.height * 0.15,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                items[index]['image'],
                              ),
                              height: size.height * 0.15,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(items[index]['name']),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          Text(
                            items[index]['dis_price'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => ItemScreen(
                            id: items[index]['id'],
                            name: items[index]['name'],
                            orgPrice: items[index]['org_price'],
                            disPrice: items[index]['dis_price'],
                            description: items[index]['description'],
                            imageUrl: items[index]['image'],
                          )),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
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
