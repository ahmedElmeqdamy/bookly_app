import 'package:dio/dio.dart';

abstract class Failures {
  final String? errorMessage;

  const Failures(this.errorMessage);
}

class ServerError extends Failures {
  ServerError(super.errorMessage);

  factory ServerError.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError('Connection timeout with the server');
      case DioExceptionType.sendTimeout:
        return ServerError('Send timeout with the server');
      case DioExceptionType.receiveTimeout:
        return ServerError('Receive timeout from the server');
      case DioExceptionType.badCertificate:
        return ServerError('Invalid SSL certificate');
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final responseData = dioException.response?.data;
        return ServerError.fromResponse(statusCode, responseData);
      case DioExceptionType.cancel:
        return ServerError('Request to server was cancelled');
      case DioExceptionType.connectionError:
        if (dioException.message != null &&
            dioException.message!.toLowerCase().contains('SocketException')) {
          return ServerError('No internet connection');
        }
        return ServerError('Connection error occurred');
      case DioExceptionType.unknown:
      return ServerError('Unexpected error occurred');
    }
  }


  factory ServerError.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerError('Internal Server error, Please try later');
    } else {
      return ServerError('Opps There was an Error, Please try again');
    }
  }
}
