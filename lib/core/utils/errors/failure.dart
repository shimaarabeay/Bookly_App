import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required String errMessage}) : super(errMessage: errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection Timeout with Api Server");

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send Timeout with Api Server");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive Timeout with Api Server");

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Bad Certificate from API Server");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to API Server was cancelled");

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "No Internet Connection");

      case DioExceptionType.unknown:
        return ServerFailure(errMessage: "Unexpected Error, Please try again");

      default:
        return ServerFailure(
          errMessage: "Something went wrong, Please try again",
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      return ServerFailure(errMessage: response["error"]['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errMessage: "Your request not found , please try again",
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: "Internal Server Error, Please try again later",
      );
    } else {
      return ServerFailure(
        errMessage: "Oops, Something went wrong, Please try again",
      );
    }
  }
}
