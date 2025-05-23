import 'package:checkout_app/Features/checkout/presentaion/manager/cubit/payment_cubit.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/thank_you_view.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/excute_paypal_payment_methoud.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/widgets/get_transaction_data_methoud.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        } else if (state is PaymentFailure) {
          Navigator.of(context).pop();
          //here i put any error indicator
          SnackBar snackBar = SnackBar(content: Text(state.errmessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              // PaymentIntentInputModel paymentIntentInputModel =
              //  PaymentIntentInputModel(
              //   amount: '100', currency: 'USD',customerId: 'cus_S93Csp9l8MtbLu');
              // BlocProvider.of<PaymentCubit>(context).makePayment(
              //   paymentIntentInputModel: paymentIntentInputModel//here i put the data of final order and in this project data is static
              //   );

              var transactionsData = getTransactionsData();
              //copied from flutter_paypal_payment package
              excecutePaypalPayment(context, transactionsData);
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }
}
