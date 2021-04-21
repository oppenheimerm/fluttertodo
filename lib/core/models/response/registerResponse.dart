

import 'package:todoapp/core/models/response/baseResponse.dart';
import 'package:todoapp/core/models/response/responseError.dart';

class RegisterResponse extends BaseResponse {
  final String? id;
  final bool? success;
  final List<ResponseError>? errors;
  final String? message;

  RegisterResponse({this.id, this.success, this.errors, this.message}) :super(success: success, errors: errors, message: message);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    var errorsFromJson = json['errors'];
    //  https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
    List<ResponseError> respErrors = errorsFromJson.cast<ResponseError>();
    return RegisterResponse(
      id:json['id'],
        success:json['success'],
        errors: respErrors,
        message: json['message']
    );
  }
}
