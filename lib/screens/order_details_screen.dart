import 'package:e_commerce_app/controller/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String checkoutId;
  final String amount;
  final DateTime orderDate;
  final DateTime expectedDate;
  final String orderStatus;
  final String addresNmae;
  final String fullAddress;
  final String mobile;

  const OrderDetailsScreen({
    super.key,
    required this.checkoutId,
    required this.amount,
    required this.orderDate,
    required this.expectedDate,
    required this.orderStatus,
    required this.addresNmae,
    required this.fullAddress,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<OrderProvider>(context, listen: false)
          .previewOrderDetails(context, checkoutId);
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Order details'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: value.productDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Card(
                      elevation: 12,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: SizedBox(
                              width: size.width * 0.3,
                              child: Image(
                                image: NetworkImage(
                                  value.productDetails[index].product[0]
                                      .images[0].url,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * 0.55,
                                child: Text(
                                  "${value.productDetails[index].product[0].name}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(
                                height: size.width * 0.01,
                              ),
                              Text(
                                "(${value.productDetails[index].product[0].brand})",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: size.width * 0.01,
                              ),
                              Text(
                                "₹ ${value.productDetails[index].product[0].price}.00",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: size.width * 0.01,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Qty - ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  Text(
                                    "${value.productDetails[index].itemQuantity}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        // fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
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
                            value.orderDataList!.isEmpty
                                ? const Text('......')
                                : Text(" $checkoutId"),
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
                            Text(
                              " ₹$amount.00",
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
                            value.orderDataList!.isEmpty
                                ? const Text('......')
                                : Text(
                                    " ${DateFormat('dd-MMM-yyyy').format(orderDate).toString()}"),
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
                            value.orderDataList!.isEmpty
                                ? const Text('......')
                                : Text(" $orderStatus"),
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
                            Text(
                              " ${DateFormat('dd-MMM-yyyy').format(expectedDate).toString()}",
                            ),
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
                              addresNmae,
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
                                fullAddress,
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
                              mobile,
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: orderStatus == 'Cancelled'
                    ? null
                    : Card(
                        elevation: 20,
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (ctx) {
                                  return SizedBox(
                                    height: size.height * 0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        const Text(
                                          'Cancel order',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Reason for cancelling the order?',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  // fontWeight:
                                                  //     FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.004,
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  value
                                                      .cancelOrder(
                                                          context, checkoutId)
                                                      .whenComplete(() => value
                                                          .viewOrders(context))
                                                      .whenComplete(() =>
                                                          Navigator.of(context)
                                                              .pop())
                                                      .whenComplete(() =>
                                                          Navigator.of(ctx)
                                                              .pop());
                                                },
                                                child: const Text(
                                                  'Confirm',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Cancel Order',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
