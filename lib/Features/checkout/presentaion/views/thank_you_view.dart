import 'package:checkout_app/Features/checkout/presentaion/views/thank_you_view_body.dart';
import 'package:checkout_app/core/utils/styles.dart';
import 'package:checkout_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:// CutomAppBar()
      AppBar(
     leading: Center(
       child: SvgPicture.asset('assets/images/back_arrow.svg')),
     centerTitle: true,
            ),
      body: Transform.translate(
        offset:const Offset(0, -16),
        child:const ThankYouViewBody()),
    );
  }
}