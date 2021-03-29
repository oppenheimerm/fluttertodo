
import 'package:todoapp/core/models/response/responseError.dart';

class BaseResponse{
  final bool success;
  final List<ResponseError> errors;
  final String message;

  BaseResponse({this.success, this.errors, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    var errorsFromJson = json['errors'];
    //  https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
    List<ResponseError> respErrors = errorsFromJson.cast<ResponseError>();
    return BaseResponse(
        success:json['success'],
        errors: respErrors,
        message: json['message']
    );
  }
}