import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connectionTimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure("sendTimeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receiveTimeOut");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("requestCanceled");
      case DioExceptionType.unknown:
        if (dioException.error!.toString().contains("SocketException")) {
          return ServerFailure("noInternet");
        } else {
          return ServerFailure("unexpectedError");
        }
      default:
        return ServerFailure("Something went wrong. Try Again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (response != null && response is Map<String, dynamic>) {
      if (response.containsKey('errorMessage')) {
        return ServerFailure(response["errorMessage"].toString());
      } else if (response.containsKey('message')) {
        return ServerFailure(response["message"].toString());
      } else {
        return ServerFailure("Unknown error occurred");
      }
    } else {
      return ServerFailure("Something went wrong. Try Again");
    }
  }
}

class ServerFailureRegister extends Failure {
  ServerFailureRegister(super.errMessage);

  factory ServerFailureRegister.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailureRegister("connectionTimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailureRegister("sendTimeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailureRegister("receiveTimeOut");
      case DioExceptionType.badResponse:
        return ServerFailureRegister.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailureRegister("requestCanceled");
      case DioExceptionType.unknown:
        if (dioException.error!.toString().contains("SocketException")) {
          return ServerFailureRegister("noInternet");
        } else {
          return ServerFailureRegister("unexpectedError");
        }
      default:
        return ServerFailureRegister("Something went wrong. Try Again");
    }
  }

  factory ServerFailureRegister.fromResponse(int statusCode, dynamic response) {
    if (response != null && response is Map<String, dynamic>) {
      if (response.containsKey('errorMessage')) {
        return ServerFailureRegister(response["errorMessage"].toString());
      } else if (response.containsKey('message') &&
          response.containsKey('data')) {
        String errorMessage = response["message"];
        if (response["data"] is List && response["data"].isNotEmpty) {
          errorMessage += ": " + response["data"][0].toString();
        }
        return ServerFailureRegister(errorMessage);
      } else if (response.containsKey('message')) {
        return ServerFailureRegister(response["message"].toString());
      } else {
        return ServerFailureRegister("Unknown error occurred");
      }
    } else {
      return ServerFailureRegister("Something went wrong. Try Again");
    }
  }
}

class CustomFailure extends Failure {
  CustomFailure(super.errMessage);

  static Failure getFailure(e) {
    if (e is DioException) {
      return ServerFailure.fromDioError(e);
    } else if (e is Map<String, dynamic> && e.containsKey('errorMessage')) {
      return CustomFailure(e['errorMessage']);
    } else {
      return CustomFailure(e.toString());
    }
  }
}
