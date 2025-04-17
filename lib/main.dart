import 'package:checkout_app/Features/checkout/presentaion/views/my_cart_view.dart';
import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
//import 'dart:io' if (dart.library.html) 'package:checkout_app/web_platform_stub.dart';
//import 'package:flutter/foundation.dart' show kIsWeb;
void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCartView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//to create payment intent models
//1-PaymentIntentObject create payment intent(amount,currency)
//2-init payment sheet(PaymentIntentClientSecret)
//3-presentPaymentSheet()
//////////////

//to save a card
//1-PaymentIntentModel create payment intent(amount,currency,customerid)
//2-keySecret createEpemeralKey(customerId)
//3-initPaymentSheet(merchantDisplayName,IntentClientSecret,ephemeralKeySecret)
//4-presentPaymentSheet()