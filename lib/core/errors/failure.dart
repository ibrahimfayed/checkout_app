import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  const Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with apiserver');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with apiserver');
      case DioExceptionType.badCertificate:
        return ServerFailure('request with apiserver was bad certificated');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('request with apiserver was canceld');
      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SoketException')) {
          return ServerFailure('no connection network');
        }
        return ServerFailure('A connection error occurred'); // More general message
      case DioExceptionType.unknown:
        return ServerFailure('An unexpected error occurred, please try again');
      default:
        return ServerFailure('Oops, there was an error, Please try again'); // More general message
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (response is Map<String, dynamic> && response.containsKey('error') && response['error'] is Map<String, dynamic> && response['error'].containsKey('message')) {
       // Check if response is a Map and contains error message
      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(response['error']['message']);
      } else if (statusCode == 404) {
        return ServerFailure('Your request not found, Please try later!');
      } else if (statusCode == 500) {
        return ServerFailure('Internal server error, Please try later!');
      }
    }
     return ServerFailure('Oops, there was an error, Please try again'); // Default error

  }
}