import 'package:checkout_app/Features/checkout/presentaion/views/widgets/custom_check_icon.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/custom_dashed_line.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
         const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,//20 is the redius of white circle
            left: 8 + 20,//20 is the redius of white circle
            right: 8 + 20,
            child:const CustumDashedLine(),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child:const CircleAvatar(
              backgroundColor: Colors.white,
            ) 
            ),
            Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child:const CircleAvatar(
              backgroundColor: Colors.white,
            ) 
            ),
         const  Positioned(
            top: -50,
            left: 0,
            right: 0,
             child:  CustomCheckIcon(),
           )
        ],
      ),
    );
  }
}




