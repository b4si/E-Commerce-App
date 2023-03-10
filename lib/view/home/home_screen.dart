// ignore_for_file: must_be_immutable
import 'package:badges/badges.dart';
import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/provider/home_provider.dart';
import 'package:e_commerce_app/controller/provider/whishlist_provider.dart';
import 'package:e_commerce_app/view/cart_screen.dart';
import 'package:e_commerce_app/view/category_screens/category_screen.dart';
import 'package:e_commerce_app/view/category_screens/laptop_screen.dart';
import 'package:e_commerce_app/view/category_screens/mobile_screen.dart';
import 'package:e_commerce_app/view/category_screens/tablet_screen.dart';
import 'package:e_commerce_app/view/home/banner_widget.dart';
import 'package:e_commerce_app/view/home/home_shimmer.dart';
import 'package:e_commerce_app/view/item_screen/item_screen.dart';
import 'package:e_commerce_app/view/profile_screen.dart';
import 'package:e_commerce_app/view/search_screen.dart';
import 'package:e_commerce_app/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).bannerGetter(context);
    Provider.of<HomeProvider>(context, listen: false).productsGetter(context);
    Provider.of<CartProvider>(context, listen: false).cartPreview();
    Provider.of<WishlistProvider>(context, listen: false)
        .previewWishlistNotifier();

    return Consumer<HomeProvider>(
      builder: (context, value, child) => value.bannerList.isEmpty
          ? const HomeShimmer()
          : HomeWidget(pageController: pageController),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      // endDrawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('GADGETO'),
        actions: [
          Badge(
            showBadge: Provider.of<CartProvider>(context, listen: false)
                    .mainCartList
                    .value
                    .isEmpty
                ? false
                : true,
            position: const BadgePosition(top: 0, end: 0),
            shape: BadgeShape.circle,
            badgeColor: Colors.red,
            badgeContent: Text(
              Provider.of<CartProvider>(context, listen: false)
                  .mainCartList
                  .value
                  .length
                  .toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ));
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              ))
        ],
      ),

      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Consumer<HomeProvider>(
            builder: (context, value, child) => ListView(
              children: <Widget>[
                const BannerContainer(),
                const SizedBox(
                  height: 7,
                ),
                const BannerDots(),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mobile Phones',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MobileScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(color: Colors.blue.shade400),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ListViewSection(value: value.mobileDataList),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Laptops',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LaptopScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.blue.shade400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ListViewSection(value: value.laptopDataList),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tablets',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TabletScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.blue.shade400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 6, right: 6),
                  child: ListViewSection(value: value.tabletDataList),
                ),
              ],
            ),
          ),
          const CategoryScreen(),
          const WishListScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<HomeProvider>(
          builder: (context, value, child) => BottomNavigationBar(
            elevation: 10,
            currentIndex: value.selectedIndex,
            unselectedItemColor: Colors.white38,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.teal.shade400,
                icon: const Icon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.teal.shade400,
                icon: const Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.teal.shade400,
                icon: const Icon(FontAwesomeIcons.solidHeart),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.teal.shade400,
                icon: const Icon(FontAwesomeIcons.solidUser),
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
      ),
    );
  }
}

class ListViewSection extends StatelessWidget {
  final List value;
  const ListViewSection({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LimitedBox(
      maxHeight: size.height * 0.24,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: value.length,
        itemBuilder: (context, index) {
          return MainCard(
            index: index,
            value: value,
          );
        },
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  int index;
  final List value;
  MainCard({
    super.key,
    required this.index,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: value.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            )
          : Card(
              elevation: 10.0,
              margin: const EdgeInsets.all(5),
              shadowColor: Colors.black,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: size.width * 0.32,
                        height: size.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            fit: BoxFit.contain,
                            image:
                                NetworkImage(value[index]["images"][0]["url"]),
                            height: size.height * 0.15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: SizedBox(
                          width: size.width * 0.3,
                          height: size.height * 0.02,
                          child: Text(
                            value[index]["name"],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: size.width * 0.3,
                          height: size.height * 0.02,
                          child: Text(
                            "??? ${value[index]["price"]}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemScreen(
            id: value[index]["_id"],
            name: value[index]["name"],
            orgPrice: value[index]["originalPrice"],
            disPrice: value[index]["price"],
            description: value[index]["description"],
            imageUrl: value[index]["images"],
            highlights: value[index]["highlights"],
          ),
        ));
      },
    );
  }
}
