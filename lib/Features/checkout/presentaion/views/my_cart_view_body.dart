import 'package:checkout_app/Features/checkout/presentaion/views/payment_details_view.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/payment_details_view_body.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/cart_info.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/tatal_price_widget.dart';
import 'package:checkout_app/core/utils/styles.dart';
import 'package:checkout_app/core/widgets/custom_app_bar.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
        const CutomAppBar(title: 'My Cart',),
        const SizedBox(height: 18,),
        Expanded(child: Image.asset('assets/images/basket_image.png')),
        const SizedBox(height: 25,),
       const OrderInfoItem(
        title: 'Order Subtotal',
         value: r'$42.97' ) 
         ,const SizedBox(height: 3,),
         const OrderInfoItem(
        title: 'Discount',
         value: r'$0' )
         ,const SizedBox(height: 3,),
         const OrderInfoItem(
        title: 'Shipping',
         value: r'$8' ),
         const Divider(         
          thickness: 2,
          height: 34,
          color: Color(0xffC7C7C7),
        ),
       const TotalPrice(
          title: 'Total',
          value: r'$50.97'),
         const SizedBox(height: 16,),
          CustomButton(
            text: 'Complete Payment',
onTap: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return const PaymentDetailsView();
  }));
},
         ), 
         const SizedBox(height: 12,) 
        ],
      ),
    );
  }
}


