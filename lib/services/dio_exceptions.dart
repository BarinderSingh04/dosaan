import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        if (dioError.error is SocketException) {
          message = "Unable to connect. Please check that you are connected to "
              "the internet and try again.";
          break;
        }
        message = dioError.message.isEmpty
            ? "Error retrieving information"
            : dioError.message;
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        final response = dioError.response?.data ?? "Something went wrong!";
        message = _handleError(
          dioError.response!.statusCode,
          response.toString(),
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(int? statusCode, String? status) {
    switch (statusCode) {
      case 400:
        return status ?? 'Bad request';
      case 401:
        return status ?? 'Missing API Key';
      case 403:
        return status ?? "UnExpected error";
      case 404:
        return status ?? 'The requested resource was not found';
      case 500:
        return 'Internal server error';
      case 429:
        return 'Request limit reached';
      default:
        return 'Oops something went wrong. $status';
    }
  }

  @override
  String toString() => message!;
}
