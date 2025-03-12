import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});

final void Function()? onTap;
final String text; 

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.textstyle18,
          ),
        ),
        width: double.infinity,
        height: 73,
        decoration: ShapeDecoration(
          color:const Color(0xff34A853),
          shape: 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        )),
      ),
    );
  }
}