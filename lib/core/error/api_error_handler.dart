import 'package:dio/dio.dart';
import 'package:pet_discovery_app/core/error/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel apiHandler(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return ApiErrorModel(
            errorMessage: "The request was cancelled before being sent.",
          );

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            errorMessage:
                "Connection to the server timed out. Please try again later.",
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            errorMessage: "Sending data took too long. Please try again.",
          );

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            errorMessage: "The app couldn't receive data in time.",
          );

        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            errorMessage:
                "There is a problem with the server's security certificate.",
          );

        case DioExceptionType.badResponse:
          return badResponseError(data: error.response?.data);

        case DioExceptionType.connectionError:
          return ApiErrorModel(
            errorMessage:
                "Please check your internet connection and try again.",
          );

        case DioExceptionType.unknown:
          return ApiErrorModel(
            errorMessage: "An unexpected error occurred. Please try again.",
          );
      }
    } else {
      return ApiErrorModel(errorMessage: "Unknown error occurred");
    }
  }

  static ApiErrorModel badResponseError({required dynamic data}) {
    return ApiErrorModel(errorMessage: data['message'], errors: data['errors']);
  }
}
