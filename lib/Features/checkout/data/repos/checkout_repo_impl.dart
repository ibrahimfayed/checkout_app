import 'package:checkout_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/Features/checkout/data/repos/checkout_repo.dart';
import 'package:checkout_app/core/errors/failure.dart';
import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService =
      StripeService(); //at the next line is prefered but i use this now like vedio

  // CheckoutRepoImpl(this.stripeService);
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
