import 'package:checkout_app/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_app/Features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:checkout_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  //this is the request to line 20
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await apiService.post(
          body: paymentIntentInputModel.toJson(),
          contentType: Headers.formUrlEncodedContentType,
          url: 'https://api.stripe.com/v1/payment_intents',
          token: ApiKeys.secretKey);
      var paymentIntentModel = PaymentIntentModel.fromJson(response
          .data); //may cause an error and i solved it in notebook and vidio of integrate checkout cubit
      return paymentIntentModel;
    } catch (e) {
      print('Payment intent error: $e');
      rethrow;
    }
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    //code for init payment sheet and there is some parameters required
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
            customerEphemeralKeySecret:
                initPaymentSheetInputModel.ephemeralKeySecret,
            customerId: initPaymentSheetInputModel.customerId,
            merchantDisplayName: 'ibrahim'));
  }

  Future displayPaymentSheet() async {
    //code to display payment sheet
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      var paymentIntentModel =
          await createPaymentIntent(paymentIntentInputModel);
      var ephemeralKeyModel = await createEphemeralKey(
          customerId: paymentIntentInputModel.customerId);
      var initPaymentSheetInputModel = InitPaymentSheetInputModel(
          clientSecret: paymentIntentModel.clientSecret!,
          customerId: paymentIntentInputModel.customerId,
          ephemeralKeySecret: ephemeralKeyModel.secret!);

      await initPaymentSheet(
          initPaymentSheetInputModel: initPaymentSheetInputModel);
      await displayPaymentSheet();
    } catch (e) {
      print('Payment error: $e');
      rethrow;
    }
  }

  Future<PaymentIntentModel> createCustomer(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await apiService.post(
          body: paymentIntentInputModel.toJson(),
          contentType: Headers.formUrlEncodedContentType,
          url: 'https://api.stripe.com/v1/customers',
          token: ApiKeys.secretKey);
      var paymentIntentModel = PaymentIntentModel.fromJson(response
          .data); //may cause an error and i solved it in notebook and vidio of integrate checkout cubit
      return paymentIntentModel;
    } catch (e) {
      print('Create customer error: $e');
      rethrow;
    }
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    //i use customerId not the model because it only one parameter
    try {
      var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey, //its not important i can remove it
        headers: {
          // 'Authorization': 'Bearer ${ApiKeys.secretKey}', // CORRECT - proper string interpolation
          // 'Stripe-Version': '2023-10-16'
          'Authorization': 'Bearer $ApiKeys.secretKey',
          'Stripe-Version': '2025-03-31.basil'
        },
      );

      var ephemeralKeyModel = EphemeralKeyModel.fromJson(response
          .data); //may cause an error and i solved it in notebook and vidio of integrate checkout cubit
      return ephemeralKeyModel;
    } catch (e) {
      print('Ephemeral key error: $e');
      rethrow;
    }
  }
}
