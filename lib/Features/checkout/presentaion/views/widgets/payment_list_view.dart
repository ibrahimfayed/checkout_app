import 'package:checkout_app/Features/checkout/presentaion/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentItemsListView extends StatefulWidget {
  const PaymentItemsListView({super.key});

  @override
  State<PaymentItemsListView> createState() => _PaymentItemsListViewState();
}

class _PaymentItemsListViewState extends State<PaymentItemsListView> {
  final List<String> paymentItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  activeIndex =
                      index; //here activeIndex equals the index of item i pressd according to on tap
                  setState(() {});
                },
                child: PaymentItem(
                    isActive: activeIndex ==
                        index, //here activeIndex equals the index of item i pressd
                    image: paymentItems[index]),
              ),
            );
          }),
    );
  }
}
