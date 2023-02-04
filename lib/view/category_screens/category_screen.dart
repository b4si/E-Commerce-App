import 'package:e_commerce_app/view/category_screens/laptop_screen.dart';
import 'package:e_commerce_app/view/category_screens/mobile_screen.dart';
import 'package:e_commerce_app/view/category_screens/tablet_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisExtent: size.height * 0.23),
          children: [
            GestureDetector(
              child: CategoryCard(
                size: size,
                title: 'Mobile Phones',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIqPQr2SacHOquE9cCS2wkZn1szNphFUPG4w&usqp=CAU',
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MobileScreen(),
              )),
            ),
            GestureDetector(
              child: CategoryCard(
                size: size,
                title: 'Laptops',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR44RIRcrEY_p6PeEJrRIzSk_tTZYFk94x5J8h3Qh4EjmSqlssDbFXM226IpkunYknqrtQ&usqp=CAU',
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LaptopScreen(),
                ),
              ),
            ),
            GestureDetector(
              child: CategoryCard(
                size: size,
                title: 'Tablets',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBovp6M0aXdC73-DVbIWBqR5fwNOd9zV0wHA&usqp=CAU',
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TabletScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.size,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;
  final String title;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imageUrl,
                    ),
                    height: size.height * 0.15,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.02,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
