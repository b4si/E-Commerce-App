import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/provider/whishlist_provider.dart';
import 'package:e_commerce_app/view/item_screen/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<WishlistProvider>(context, listen: false)
        .previewWishlistNotifier();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Consumer<WishlistProvider>(
        builder: (context, value, child) => value.wishList.isEmpty
            ? Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(image: AssetImage('assets\\wishlist.jpg')),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: size.height * 0.315),
                  itemCount: value.wishList.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 10.0,
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
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Remove Item',
                                            ),
                                            content: const Text(
                                              'Are you sure you want to remove this item?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Provider.of<WishlistProvider>(
                                                    context,
                                                    listen: false,
                                                  )
                                                      .wishListDeleteNotifier(
                                                        context,
                                                        value.wishList[index]
                                                            .product[0].id,
                                                      )
                                                      .whenComplete(
                                                        () => Navigator.of(
                                                                context)
                                                            .pop(),
                                                      );
                                                },
                                                child: const Text(
                                                  'Remove',
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.redAccent,
                                    )),
                              ],
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => ItemScreen(
                                      id: value.wishList[index].product[0].id,
                                      name:
                                          value.wishList[index].product[0].name,
                                      orgPrice: value.wishList[index].product[0]
                                          .originalPrice,
                                      disPrice: value
                                          .wishList[index].product[0].price,
                                      description: value.wishList[index]
                                          .product[0].description,
                                      imageUrl: value.wishList[index].product[0]
                                          .images[0].url,
                                      highlights: value.wishList[index]
                                          .product[0].highlights,
                                    )),
                              )),
                              child: Image(
                                image: NetworkImage(
                                  value.wishList[index].product[0].images[0].url
                                      .toString(),
                                ),
                                height: size.height * 0.15,
                              ),
                            ),
                            Text(value.wishList[index].product[0].name
                                .toString()),
                            SizedBox(
                              width: size.width * 0.30,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: Provider.of<CartProvider>(
                                              context)
                                          .checkingInCart(value
                                              .wishList[index].product[0].id)
                                      ? MaterialStateProperty.all(Colors.white)
                                      : MaterialStateProperty.all(
                                          Colors.orange),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: Provider.of<CartProvider>(context,
                                            listen: false)
                                        .checkingInCart(
                                            value.wishList[index].product[0].id)
                                    ? null
                                    : () {
                                        Provider.of<CartProvider>(
                                          context,
                                          listen: false,
                                        )
                                            .addToCart(
                                                context,
                                                value.wishList[index].product[0]
                                                    .id)
                                            .whenComplete(
                                              () => Provider.of<CartProvider>(
                                                context,
                                                listen: false,
                                              ).cartPreview(),
                                            );
                                      },
                                child: Provider.of<CartProvider>(context)
                                        .checkingInCart(
                                  value.wishList[index].product[0].id,
                                )
                                    ? const Text(
                                        'Item in cart',
                                        style: TextStyle(color: Colors.black),
                                      )
                                    : const Text(
                                        'Add to Cart',
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
