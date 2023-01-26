import 'package:e_commerce_app/controller/provider/home_provider.dart';
import 'package:e_commerce_app/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Mobile Phones'),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: size.height * 0.235),
            itemCount: value.mobileDataList.length,
            itemBuilder: (context, index) => GestureDetector(
              child: Center(
                child: Card(
                  elevation: 10.0,
                  margin: const EdgeInsets.all(5),
                  shadowColor: Colors.black,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.003,
                          ),
                          SizedBox(
                            width: size.width * 0.50,
                            height: size.height * 0.15,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(value.mobileDataList[index]
                                    ["images"][0]["url"]),
                                height: size.height * 0.15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4),
                            child: SizedBox(
                              width: size.width * 0.3,
                              height: size.height * 0.02,
                              child: Text(
                                value.mobileDataList[index]["name"],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              width: size.width * 0.3,
                              height: size.height * 0.02,
                              child: Text(
                                value.mobileDataList[index]["price"],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemScreen(
                    id: value.mobileDataList[index]["_id"],
                    name: value.mobileDataList[index]["name"],
                    orgPrice: value.mobileDataList[index]["originalPrice"],
                    disPrice: value.mobileDataList[index]["price"],
                    description: value.mobileDataList[index]["description"],
                    imageUrl: value.mobileDataList[index]["images"][0]["url"],
                    highlights: value.mobileDataList[index]["highlights"],
                  ),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
