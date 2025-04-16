import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title
          //'Date'
          ,
          textAlign: TextAlign.center,
          style: Styles.textstyle18,
        ),
        Text(
          value
          //'01/24/2023'
          ,
          textAlign: TextAlign.center,
          style: Styles.textstyleBold18,
        )
      ],
    );
  }
}
