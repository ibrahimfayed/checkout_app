import 'package:checkout_app/Features/checkout/presentaion/views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const
     MaterialApp(home: MyCartView(),
     debugShowCheckedModeBanner: false,);
  }
}