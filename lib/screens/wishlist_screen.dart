import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: size.height * 0.315),
        itemCount: 4,
        itemBuilder: (context, index) => GestureDetector(
          child: Card(
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
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.redAccent,
                            )),
                      ],
                    ),
                    Image(
                      image: const NetworkImage(
                          'https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1662443667/Croma%20Assets/Communication/Mobiles/Images/251804_p9fded.png/mxw_2048,f_auto'),
                      height: size.height * 0.15,
                    ),
                    const Text("OnePlus Nord CE"),
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
    );
  }
}
