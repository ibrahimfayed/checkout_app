import 'package:checkout_app/Features/checkout/presentaion/views/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/payment_list_view.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentMethoudsButtonSheet extends StatelessWidget {
  const PaymentMethoudsButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, //عشان ميبقاش ارتفاع علي الفاضي أنا مش حابه
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentItemsListView(),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
