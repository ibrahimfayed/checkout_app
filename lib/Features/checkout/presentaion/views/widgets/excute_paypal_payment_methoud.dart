import 'dart:developer';

import 'package:checkout_app/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_app/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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