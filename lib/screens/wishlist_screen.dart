import 'package:e_commerce_app/provider/whishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<WishlistProvider>(context, listen: false).previewWishlist();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<WishlistProvider>(
          builder: (context, value, child) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: size.height * 0.315),
            itemCount: value.wishList.value.length,
            itemBuilder: (context, index) => value.wishList.value.isEmpty
                ? const Center(
                    child: Text(
                      'Your Wishlist is empty',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : GestureDetector(
                    child: Card(
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
                                        Provider.of<WishlistProvider>(
                                          context,
                                          listen: false,
                                        ).deleteWishlist(value.wishList
                                            .value[index].product[0].id);
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.solidHeart,
                                        color: Colors.redAccent,
                                      )),
                                ],
                              ),
                              Image(
                                image: NetworkImage(
                                  value.wishList.value[index].product[0]
                                      .images[0].url
                                      .toString(),
                                ),
                                height: size.height * 0.15,
                              ),
                              Text(value.wishList.value[index].product[0].name
                                  .toString()),
                              SizedBox(
                                width: size.width * 0.30,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
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
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: ((context) =>  ItemScreen()),
                      //   ),
                      // );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
