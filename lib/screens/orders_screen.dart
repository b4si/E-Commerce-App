import 'package:e_commerce_app/screens/item_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              GestureDetector(
                onTap: (() => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const ItemScreen()),
                      ),
                    )),
                child: Image(
                  image: const NetworkImage(
                      'https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1662443667/Croma%20Assets/Communication/Mobiles/Images/251804_p9fded.png/mxw_2048,f_auto'),
                  height: size.height * 0.22,
                  width: size.width * 0.32,
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const ItemScreen()),
                      ),
                    ),
                    child: const Text(
                      'OnePlus Nord CE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const ItemScreen()),
                      ),
                    ),
                    child: const Text(
                      "₹19,000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Text(
                    "MRP:₹22,999",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const Text('Shipped'),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: size.width * 0.30,
                    height: size.height * 0.04,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
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
                        'Cancel Order',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
