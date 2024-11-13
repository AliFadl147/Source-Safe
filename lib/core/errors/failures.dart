import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response?.statusCode, dioError.response?.data);
      
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioError.message != null) {
          if (dioError.message!.contains('SocketException')) {
            return ServerFailure('No Internet Connection');
          }
        } else if (dioError.message == null) {
          return ServerFailure('Oops There was an Error, Please try again');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Oops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['title']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops There was an Error, Please try again');
    }
  }
}

class AuthServerFailure extends Failure {
  AuthServerFailure(super.errMessage);

  factory AuthServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return AuthServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return AuthServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return AuthServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        // Pass both the status code and the response body to fromResponse
        return AuthServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data ?? {},
        );

      case DioExceptionType.cancel:
        return AuthServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioError.message != null) {
          if (dioError.message!.contains('SocketException')) {
            return AuthServerFailure('No Internet Connection');
          }
        } else if (dioError.message == null) {
          return AuthServerFailure('Oops There was an Error, Please try again');
        }
        return AuthServerFailure('Unexpected Error, Please try again!');
      default:
        return AuthServerFailure('Oops There was an Error, Please try again');
    }
  }

  factory AuthServerFailure.fromResponse(
      int? statusCode, Map<String, dynamic> responseBody) {
    if (statusCode == 400) {
      return AuthServerFailure('Invalid Email or Password');
    } else if (statusCode == 409) {
      // Handling the 409 Conflict
      if (responseBody.containsKey('title')) {
        return AuthServerFailure(responseBody['title']);
      }
      return AuthServerFailure('Email is already in use');
    } else if (statusCode == 401) {
      return AuthServerFailure('Incorrect Email or Password');
    } else if (statusCode == 404) {
      return AuthServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return AuthServerFailure('Internal Server error, Please try later');
    } else {
      return AuthServerFailure('Oops There was an Error, Please try again');
    }
  }
}