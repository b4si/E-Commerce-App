// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/provider/whishlist_provider.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
  String imageUrl;
  String highlights;

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
                child: Stack(children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.55,
                    child: Image(
                      image: NetworkImage(imageUrl),
                      height: 300,
                      fit: BoxFit.cover,
                    ),
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
                                            .deleteWishlist(id, context)
                                            .whenComplete(
                                                () => value.previewWishlist());
                                      }
                                    : () {
                                        value
                                            .addToWishlist(id, context)
                                            .whenComplete(
                                                () => value.previewWishlist());
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
              Consumer<CartProvider>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: SizedBox(
                        height: size.height * 0.06,
                        width: size.width * 0.92,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: value.checkingInCart(id)
                                ? MaterialStateProperty.all(Colors.white)
                                : MaterialStateProperty.all(
                                    Colors.orange.shade400),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: const BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          onPressed: value.checkingInCart(id)
                              ? (() => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const CartScreen(),
                                    ),
                                  ))
                              : () {
                                  Provider.of<CartProvider>(
                                    context,
                                    listen: false,
                                  )
                                      .addToCart(context, id)
                                      .whenComplete(() => value.cartPreview());
                                },
                          child: value.checkingInCart(id)
                              ? const Text(
                                  'Go to cart',
                                  style: TextStyle(color: Colors.black),
                                )
                              : const Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.black),
                                ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.06,
                    //   width: size.width * 0.41,
                    //   child: TextButton(
                    //     style: ButtonStyle(
                    //       shape:
                    //           MaterialStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(7),
                    //           side: const BorderSide(color: Colors.grey),
                    //         ),
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       Provider.of<WishlistProvider>(
                    //         context,
                    //         listen: false,
                    //       ).addToWishlist(id, context);
                    //     },
                    //     child: const Text(
                    //       'Add to WishList',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
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
