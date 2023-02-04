import 'package:e_commerce_app/controller/provider/home_provider.dart';
import 'package:e_commerce_app/controller/provider/search_provider.dart';
import 'package:e_commerce_app/view/home/home_screen.dart';
import 'package:e_commerce_app/view/item_screen/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<SearchProvider>(
        context,
        listen: false,
      ).requestFocus();
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) {
                  Provider.of<HomeProvider>(context, listen: false)
                      .runFilter(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          (MaterialPageRoute(
                            builder: ((context) {
                              return HomeScreen();
                            }),
                          )),
                          (route) => false);
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.grey,
                    ),
                  ),
                ),
                focusNode: Provider.of<SearchProvider>(
                  context,
                  listen: false,
                ).focusNode,
              ),
            ),
            const Expanded(
              child:
                  //  Provider.of<HomeProvider>(context, listen: false)
                  //         .results
                  //         .isEmpty
                  //     ?
                  //     const Center(
                  //         child: Text('Item not found'),
                  //       )
                  //     :
                  SearchListViewSection(),
            )
          ],
        ),
      ),
    );
  }
}

class SearchListViewSection extends StatelessWidget {
  const SearchListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<HomeProvider>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.allProducts.length,
        itemBuilder: (context, index) => Card(
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemScreen(
                  id: value.allProducts[index]['_id'],
                  name: value.allProducts[index]['name'],
                  orgPrice: value.allProducts[index]['originalPrice'],
                  disPrice: value.allProducts[index]['price'],
                  description: value.allProducts[index]['description'],
                  imageUrl: value.allProducts[index]["images"][0]["url"],
                  highlights: value.allProducts[index]["highlights"],
                ),
              ),
            ),
            child: Row(
              children: [
                Image(
                  image: NetworkImage(
                    value.allProducts[index]['images'][0]["url"],
                  ),
                  height: size.height * 0.10,
                  width: size.width * 0.20,
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value.allProducts[index]["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "₹${value.allProducts[index]["price"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 1),
                    ),
                    Text(
                      "₹${value.allProducts[index]["originalPrice"]}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                          color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
