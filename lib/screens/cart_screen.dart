import 'package:e_commerce_app/provider/cart_provider.dart';
import 'package:e_commerce_app/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<CartProvider>(context, listen: false).checkingButton();

    Provider.of<CartProvider>(context, listen: false).cartPreview();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView(
        children: [
          Consumer<CartProvider>(
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.mainCartList.value.isEmpty
                    ? 0
                    : value.mainCartList.value.length,
                itemBuilder: (context, index) => Card(
                  elevation: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        // onTap: (() => Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: ((context) =>  ItemScreen()),
                        //       ),
                        //     )),

                        child: Image(
                          image: NetworkImage(
                            value.mainCartList.value[index].product[0]
                                .images![0]!.url
                                .toString(),
                          ),
                          height: size.height * 0.22,
                          width: size.width * 0.32,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            // onTap: () => Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: ((context) =>  ItemScreen()),
                            //   ),
                            // ),
                            child: Text(
                              value.mainCartList.value[index].product[0].name!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          GestureDetector(
                            // onTap: () => Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: ((context) =>  ItemScreen()),
                            //   ),
                            // ),
                            child: Text(
                              "₹ ${value.mainCartList.value[index].product[0].price!}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            "₹ ${value.mainCartList.value[index].product[0].originalPrice!}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const Text('Delivery by Fri Oct 14 '),
                          const Text(
                            'FREE Delivery',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                Opacity(
                                  opacity: value.isButtonEnabled ? 1.0 : 0.5,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    onPressed: value.isButtonEnabled
                                        ? () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .cartDecrement(
                                                    context,
                                                    value
                                                        .mainCartList
                                                        .value[index]
                                                        .product[0]
                                                        .id);
                                          }
                                        : null,
                                    child: const Text('-',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.040,
                                  width: size.width * 0.10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Text(
                                    value.mainCartList.value[index].itemQuantity
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .cartIncrement(value.mainCartList
                                            .value[index].product[0].id);
                                  },
                                  child: const Text('+',
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          value.deleteItem(
                            value.mainCartList.value[index].product[0].id,
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<CartProvider>(
              builder: (context, value, child) => value
                      .mainCartList.value.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 250),
                      child: Center(
                        child: Text(
                          "Oops!! Your cart is Empty",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      // height: size.height * 0.23,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 10,
                            ),
                            child: Text(
                              'Price Details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Price (${value.mainCartList.value.length} items)'),
                                Text(
                                  "₹${value.subTotal.toString()}.00",
                                  style: const TextStyle(letterSpacing: 1.5),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Delivery charges',
                                ),
                                value.shipping == 0
                                    ? const Text(
                                        '₹FREE',
                                        style: TextStyle(
                                            color: Colors.green,
                                            letterSpacing: 1.5),
                                      )
                                    : Text(
                                        value.shipping.toString(),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "₹${value.grandtotal.toString()}.00",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.040,
                                width: size.width * 0.30,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orangeAccent),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentScreen(),
                                    ));
                                  },
                                  child: const Text(
                                    'Place Order',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.06,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
