import 'package:checkout_app/Features/checkout/presentaion/views/my_cart_view_body.dart';
import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCartViewBody(),
    );
  }
}
