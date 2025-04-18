import 'dart:developer';
import 'package:checkout_app/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_app/Features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_app/Features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout_app/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/Features/checkout/presentaion/manager/cubit/payment_cubit.dart';
import 'package:checkout_app/Features/checkout/presentaion/views/thank_you_view.dart';
import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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

  void excecutePaypalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true, //live or test mode defult in test
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions:  [
          //here the data of order in details
          {
            "amount": transactionsData.amount.toJson()
               
              //i replaced below code to a model i created and use above this line
              // {
              // "total":
              //     '100', //total here must be equal of details below
              // "currency": "USD",
              // "details": {
              //   "subtotal": '100',
              //   "shipping": '0',
              //   "shipping_discount": 0
              // }
              //}
            ,
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
    
             "item_list": transactionsData.itemList.toJson(),
            // {
            //   "items": [
            //     //all numbers here is too importat
            //     {
            //       "name": "Apple",
            //       "quantity": 4,
            //       "price": '10',
            //       "currency": "USD"
            //     },
            //     {
            //       "name": "Pineapple",
            //       "quantity": 5,
            //       "price": '12',
            //       "currency": "USD"
            //     }
            //   ],
    
            //   // Optional
            //   //   "shipping_address": {
            //   //     "recipient_name": "Tharwat samy",
            //   //     "line1": "tharwat",
            //   //     "line2": "",
            //   //     "city": "tharwat",
            //   //     "country_code": "EG",
            //   //     "postal_code": "25025",
            //   //     "phone": "+00000000",
            //   //     "state": "ALex"
            //   //  },
            // }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
 ({AmountModel amount, ItemListModel itemList}) getTransactionsData(){//this type i git it from the type of return below
    var amount = AmountModel(
                total: "100",
                currency: 'USD',
                details: Details(
                  shipping: "0",
                  shippingDiscount: 0,
                  subtotal: '100'
                )
              );
              List <OrderItemModel> orders = [
                OrderItemModel(
                  currency: 'USD',
                  name: 'Apple',
                  price: '4',
                  quantity: 10
                ),
                OrderItemModel(
                  currency: 'USD',
                  name: 'Apple',
                  price: '5',
                  quantity: 12
                )
              ];
              var itemList = ItemListModel(
               orders: orders
              );
              return(amount:amount, itemList:itemList);//this the record
  }
}
