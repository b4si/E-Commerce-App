import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/controller/provider/checkout_provider.dart';
import 'package:e_commerce_app/controller/provider/order_provider.dart';
import 'package:e_commerce_app/controller/provider/payment_provider.dart';
import 'package:e_commerce_app/controller/provider/profile_screen_provider.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/add_address_screen.dart';
import 'package:e_commerce_app/screens/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
    required this.grandTotal,
    required this.subtotal,
    required this.deliveryCharge,
  });

  final int grandTotal;
  final int subtotal;
  final int deliveryCharge;

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileScreenProvider>(context, listen: false)
        .showAddress(context)
        .whenComplete(() =>
            Provider.of<ProfileScreenProvider>(context, listen: false)
                .initialFunction());

    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Payment Section'),
      ),
      body: Consumer<ProfileScreenProvider>(
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Deliver to :',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        value.addressList.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 2,
                                ),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => AddAddressScreen(),
                                    ));
                                  },
                                  child: const Text('Add Address'),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 2),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AddressScreen(),
                                    ));
                                  },
                                  child: const Text('Change'),
                                ),
                              ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            value.addressList.isEmpty
                                ? "Add Your Address"
                                : emailIds['user']['name'],
                            style: const TextStyle(
                              fontSize: 16,
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
                          child: Text(
                            value.addressList.isEmpty
                                ? '-------'
                                : '${value.tempAddress!.houseNo}, ${value.tempAddress!.street}, ',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: Text(
                            '${value.tempAddress!.district}, ${value.tempAddress!.state}, ',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          child: Text(
                            ' ${value.tempAddress!.pincode}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
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
                              'Price (${cartProvider.mainCartList.value.length} items)'),
                          Text(
                            "₹${cartProvider.subTotal.toString()}.00",
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
                          cartProvider.shipping == 0
                              ? const Text(
                                  '₹FREE',
                                  style: TextStyle(
                                      color: Colors.green, letterSpacing: 1.5),
                                )
                              : Text(
                                  cartProvider.shipping.toString(),
                                  style: const TextStyle(color: Colors.green),
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
                            "₹${cartProvider.grandtotal.toString()}.00",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: size.height * 0.06,
                    width: size.width * 0.4,
                    child: TextButton(
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 2), () {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                          );
                        });
                        // Navigator.of(context).pop();
                        Provider.of<CheckoutProvider>(context, listen: false)
                            .chekoutNotifier(
                                context, 'COD', 'COD', cartProvider.subTotal);
                      },
                      child: const Text(
                        'Cash on Delivery',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent.shade700,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: size.height * 0.06,
                    width: size.width * 0.4,
                    child: TextButton(
                      onPressed: () {
                        Provider.of<PaymentProvider>(context, listen: false)
                            .openRazorpay(context);
                      },
                      child: const Text(
                        'Online Payment',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
