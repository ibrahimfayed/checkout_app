import 'package:checkout_app/Features/checkout/presentaion/views/thank_you_view.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/custom_credit_card.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/payment_item.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/payment_list_view.dart';
import 'package:checkout_app/core/widgets/custom_app_bar.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: CutomAppBar(
          title: 'Payment Details',
        ),
      ),
      const SliverToBoxAdapter(
        child: PaymentItemsListView(),
      ),
      SliverToBoxAdapter(
        child: CustomCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
            child: CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ThankYouView();
                  }));

                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Payment',
            ),
          ),
        ),
      ),
    ]);
  }
}
