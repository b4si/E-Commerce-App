import 'package:e_commerce_app/controller/provider/order_provider.dart';
import 'package:e_commerce_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderSuccessScreen extends StatelessWidget {
  final String paymentId;
  const OrderSuccessScreen({
    super.key,
    required this.paymentId,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<OrderProvider>(context, listen: false)
          .getOrderDetails(context);
    });

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order summary'),
      ),
      body: SingleChildScrollView(
        child: Consumer<OrderProvider>(
          builder: (context, value, child) => Column(
            children: [
              const Image(
                image: AssetImage('assets\\OrderSucces1.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: size.height * 0.06,
                  width: size.width, // * 0.4,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: ((context) => HomeScreen()),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'Back to shopping',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Order Summary',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Order ID ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            value.orderDataList.isEmpty
                                ? const Text('......')
                                : Text(" ${value.orderDataList[0].id}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Payment ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(" $paymentId"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Bill Amount ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            value.orderDataList.isEmpty
                                ? const Text('......')
                                : Text(
                                    " ₹${value.orderDataList.first.bill}.00",
                                    style: const TextStyle(letterSpacing: 1),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Order Date ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            value.orderDataList.isEmpty
                                ? const Text('......')
                                : Text(DateFormat('dd-MMM-yyyy')
                                    .format(value.orderDataList.first.createdAt)
                                    .toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Order Status ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            value.orderDataList.isEmpty
                                ? const Text('......')
                                : Text(
                                    " ${value.orderDataList.first.orderStatus[0].type}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Expected Date ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            value.orderDataList.isEmpty
                                ? const Text('......')
                                : Text(DateFormat('dd-MMM-yyyy')
                                    .format(
                                        value.orderDataList.first.expectedDate)
                                    .toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Card(
                  elevation: 15,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value.orderDataList.isEmpty
                                  ? "Add Your Address"
                                  : '${value.orderDataList[0].address.name}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: SizedBox(
                              width: size.width * 0.85,
                              child: Text(
                                value.orderDataList.isEmpty
                                    ? '-------'
                                    : '${value.orderDataList[0].address.addressLine}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Text(
                              value.orderDataList.isEmpty
                                  ? '-------'
                                  : '${value.orderDataList[0].address.mobile}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.007,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
