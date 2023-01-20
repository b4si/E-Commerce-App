// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/provider/cart_provider.dart';
import 'package:e_commerce_app/provider/whishlist_provider.dart';
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
  });

  String id;
  String name;
  String orgPrice;
  String disPrice;
  String description;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    // Provider.of<WishlistProvider>(context, listen: false).checkingWishlist(id);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: () {
                        Provider.of<WishlistProvider>(context, listen: false)
                            .addToWishlist(id, context)
                            .whenComplete(
                              () => Provider.of<WishlistProvider>(
                                context,
                                listen: false,
                              ).checkingWishlist(id),
                            )
                            .whenComplete(
                              () => Provider.of<WishlistProvider>(
                                context,
                                listen: false,
                              ).previewWishlist(),
                            );
                      },
                      icon:
                          Provider.of<WishlistProvider>(context, listen: false)
                                  .isInWishlist
                              ? const Icon(
                                  FontAwesomeIcons.solidHeart,
                                  color: Colors.red,
                                )
                              : Icon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.grey.shade400,
                                ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.45,
                child: Image(
                  image: NetworkImage(imageUrl),
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: size.height * 0.002,
              ),
              Text(
                ('₹ $disPrice.00'),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                ('₹ $orgPrice.00'),
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.red),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: size.width * 0.30,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addToCart(context, id);
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.30,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Buy now',
                        style: TextStyle(color: Colors.white),
                      ),
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
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.01,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 4,
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
