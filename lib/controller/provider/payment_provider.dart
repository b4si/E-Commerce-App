import 'package:e_commerce_app/controller/provider/cart_provider.dart';
import 'package:e_commerce_app/services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider with ChangeNotifier {
  Future openRazorpay(context) async {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_y5gvtRY9ZcI4Xg',
      'amount':
          Provider.of<CartProvider>(context, listen: false).subTotal * 100,
      'name': 'Gadgeto.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        (PaymentFailureResponse response) {
      PaymentServices().handlePaymentErrorResponse(response, context);
    });
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) {
      PaymentServices().handlePaymentSuccessResponse(response, context);
    });
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        (ExternalWalletResponse response) {
      PaymentServices().handleExternalWalletSelected(response, context);
    });
    razorpay.open(options);
  }
}
