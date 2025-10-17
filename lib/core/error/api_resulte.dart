import 'package:pet_discovery_app/core/error/api_error_model.dart';

class ApiResulte<T> {
  ApiResulte();

  factory ApiResulte.success(T data) = Success<T>;
  factory ApiResulte.failure(ApiErrorModel data) = Failure<T>;
}

class Success<T> extends ApiResulte<T> {
  T? data;
  Success(this.data);
}

class Failure<T> extends ApiResulte<T> {
  ApiErrorModel apiErrorModel;
  Failure(this.apiErrorModel);
}
