// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/provider/home_provider.dart';
import 'package:e_commerce_app/controller/provider/whishlist_provider.dart';
import 'package:e_commerce_app/view/item_screen/add_to_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({
    super.key,
    required this.id,
    required this.name,
    required this.orgPrice,
    required this.disPrice,
    required this.description,
    required this.imageUrl,
    required this.highlights,
  });

  String id;
  String name;
  String orgPrice;
  String disPrice;
  String description;
  List imageUrl;
  String highlights;
  // int imageActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).checkingInCart(id);

    // Provider.of<WishlistProvider>(context, listen: false).checkingWishlist(id);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: Text(name),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Consumer<HomeProvider>(
                  builder: (context, value, child) => Stack(children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                          height: size.height * 0.55,
                          scrollPhysics: imageUrl.length == 1
                              ? const NeverScrollableScrollPhysics()
                              : const ScrollPhysics(),
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          onPageChanged: (index1, reason) {
                            value.changeImageIndex(index1);
                          }),
                      itemCount: imageUrl.length,
                      itemBuilder: (context, index, realIndex) {
                        return Image(
                          image: NetworkImage(imageUrl[index]["url"]),
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Consumer<WishlistProvider>(
                      builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: value.checkingWishlist(id)
                                      ? () {
                                          value
                                              .wishListDeleteNotifier(
                                                  context, id)
                                              .whenComplete(() => value
                                                  .previewWishlistNotifier());
                                        }
                                      : () {
                                          value
                                              .addToWishlistNotifier(
                                                  context, id)
                                              .whenComplete(() => value
                                                  .previewWishlistNotifier());
                                        },
                                  child: value.checkingWishlist(id)
                                      ? Icon(
                                          FontAwesomeIcons.solidHeart,
                                          color: Colors.red.shade400,
                                          size: 26,
                                        )
                                      : Icon(
                                          FontAwesomeIcons.solidHeart,
                                          color: Colors.grey.shade400,
                                          size: 26,
                                        ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              imageUrl.length == 1
                  ? const SizedBox()
                  : Consumer<HomeProvider>(
                      builder: (context, value, child) => SizedBox(
                        child: AnimatedSmoothIndicator(
                          activeIndex: value.imageActiveIndex,
                          count: imageUrl.length,
                          effect: SlideEffect(
                            radius: 10,
                            dotHeight: 9,
                            dotWidth: 9,
                            dotColor: Colors.grey,
                            activeDotColor: Colors.teal.shade400,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: size.height * 0.009,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 8),
                child: Text(
                  highlights,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ('$orgPrice.00'),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.shade500,
                              fontSize: 17),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          ('₹$disPrice.00'),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.005,
              ),

              // SizedBox(
              //   height: size.height * 0.01,
              // ),

              SizedBox(
                height: size.height * 0.02,
              ),
              AddToCartButton(size: size, id: id),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets\\Replacment.jpg'),
                          width: size.width * 0.35,
                          height: size.height * 0.035,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Free 7 Days',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Text(
                          'Replacement',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets\\images.jpg'),
                          width: size.width * 0.35,
                          height: size.height * 0.035,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Cash on Delivery',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const Text(
                          'Available',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets\\G.jpg'),
                          width: size.width * 0.35,
                          height: size.height * 0.035,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Gadgeto',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Text(
                          ' G-Assured',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.02,
                      ),
                      // const Text(
                      //   'Details',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 16),
                      //   maxLines: 4,
                      // ),
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
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
