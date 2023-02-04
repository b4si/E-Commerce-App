import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.size,
    required this.id,
  }) : super(key: key);

  final Size size;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
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
                      : MaterialStateProperty.all(Colors.orange.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}
