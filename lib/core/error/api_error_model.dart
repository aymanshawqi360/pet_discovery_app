import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? errorMessage;
  Map<String, dynamic>? errors;
  ApiErrorModel({this.errorMessage, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String allSignUpError() {
    if (errors == null || errors!.isEmpty)
      return errorMessage ?? "Unknown error occurred";
    final message = StringBuffer();
    for (var data in errors!.entries) {
      // for (var d in data.value) {
      // }
      message.writeln(data.value);
    }
    return message.toString();
  }
}
