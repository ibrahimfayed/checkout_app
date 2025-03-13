import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 23),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/master_card.svg'),
            const SizedBox(width: 22,),
           const Padding(
              padding:  EdgeInsets.symmetric(vertical:8 ),
              child: Column(
                children: [
              Text('Credit Card',
              style: Styles.textstyle18,),
              Text('Mastercard **78',
              style: Styles.textstyle18,)
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}