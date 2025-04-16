import 'package:checkout_app/Features/checkout/presentaion/views/widgets/card_info_widget.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/payment_item_info.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/tatal_price_widget.dart';
import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: const Color(0xffD9D9D9),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'Thank You!',
              textAlign: TextAlign.center,
              style: Styles.textstyle25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.textstyle20,
            ),
            const SizedBox(
              height: 42,
            ),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'Time',
              value: '10:15 AM',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            const Divider(
              height: 60, //30 from top and 30 from buttom
              thickness: 2,
            ),
            const TotalPrice(title: 'Total', value: r'$50.97'),
            const SizedBox(
              height: 30,
            ),
            const CardInfoWidget(),
            const SizedBox(
              height: 20 + 57,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, //i used spaceBetween because i will use padding around the whole column
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ) //مش مهتم بيها قوي لان مش هستخدمها كده بالنسبة لللوجيك
                ,
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1.5,
                          color: Color(0xff34A853),
                        ),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: Styles.textstyle24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
