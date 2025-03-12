import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
final String title,value;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         Text(
        title ,   
        style: Styles.textstyle18,),
        const Spacer(),
         Text(
        value,
        style: Styles.textstyle18,),
        
      ],
    );
  }
}