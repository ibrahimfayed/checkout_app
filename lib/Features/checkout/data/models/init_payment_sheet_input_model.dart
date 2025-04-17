class InitPaymentSheetInputModel {
  final String clientSecret;//it is required all time
  final String customerId;
  final String ephemeralKeySecret;

  InitPaymentSheetInputModel({required this.clientSecret, required this.customerId, required this.ephemeralKeySecret});
}