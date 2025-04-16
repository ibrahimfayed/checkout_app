import 'package:checkout_app/Features/checkout/presentaion/views/payment_details_view_body.dart';
import 'package:checkout_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentDetailsViewBody(),
    );
  }
}
