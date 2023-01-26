import 'package:e_commerce_app/controller/provider/home_provider.dart';
import 'package:e_commerce_app/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaptopScreen extends StatelessWidget {
  const LaptopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Laptops'),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: size.height * 0.235,
            ),
            itemCount: value.laptopDataList.length,
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
                                image: NetworkImage(
                                  value.laptopDataList[index]["images"][0]
                                      ["url"],
                                ),
                                height: size.height * 0.15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                              vertical: 4,
                            ),
                            child: SizedBox(
                              width: size.width * 0.3,
                              height: size.height * 0.02,
                              child: Text(
                                value.laptopDataList[index]["name"],
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
                                value.laptopDataList[index]["price"],
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
                    id: value.laptopDataList[index]["_id"],
                    name: value.laptopDataList[index]["name"],
                    orgPrice: value.laptopDataList[index]["originalPrice"],
                    disPrice: value.laptopDataList[index]["price"],
                    description: value.laptopDataList[index]["description"],
                    imageUrl: value.laptopDataList[index]["images"][0]["url"],
                    highlights: value.laptopDataList[index]["highlights"],
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
