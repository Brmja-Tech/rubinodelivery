import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  final int? statusCode;

  const Failure(this.errMessage, {this.statusCode});
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message, {int? statusCode})
      : super(message, statusCode: statusCode);

  factory ServerFailure.fromDioExp(DioException dioExp) {
    switch (dioExp.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout', statusCode: 408);
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout', statusCode: 408);
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout', statusCode: 408);
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate', statusCode: 495);
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            statusCode: dioExp.response?.statusCode ?? 500,
            response: dioExp.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled', statusCode: 499);
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error', statusCode: 503);
      case DioExceptionType.unknown:
        if (dioExp.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection', statusCode: 503);
        }
        return ServerFailure('Unexpected Error, Try again later',
            statusCode: 500);

      }
  }

  factory ServerFailure.fromBadResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode >= 400 && statusCode < 500) {
      if (response is Map<String, dynamic>) {
        final message =
            response['message'] ?? response['error'] ?? response['detail'];
        if (message != null) {
          return ServerFailure(message.toString(), statusCode: statusCode);
        }
      }

      switch (statusCode) {
        case 400:
          return ServerFailure('Bad Request', statusCode: statusCode);
        case 401:
          return ServerFailure('Unauthorized', statusCode: statusCode);
        case 403:
          return ServerFailure('Forbidden', statusCode: statusCode);
        case 404:
          return ServerFailure('Resource Not Found', statusCode: statusCode);
        case 405:
          return ServerFailure('Method Not Allowed', statusCode: statusCode);
        case 409:
          return ServerFailure('Conflict', statusCode: statusCode);
        case 422:
          return ServerFailure('Unprocessable Entity', statusCode: statusCode);
        case 429:
          return ServerFailure('Too Many Requests', statusCode: statusCode);
        default:
          return ServerFailure('Client Error', statusCode: statusCode);
      }
    } else if (statusCode >= 500) {
      return ServerFailure('Internal Server Error', statusCode: statusCode);
    }

    return ServerFailure('Unknown Error', statusCode: statusCode);
  }

  factory ServerFailure.mapsError({required String e}) {
    return ServerFailure('Maps Error: $e', statusCode: 500);
  }
}
