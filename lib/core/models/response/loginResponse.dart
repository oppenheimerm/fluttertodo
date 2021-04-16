
import 'package:todoapp/core/models/response/accessToken.dart';
import 'package:todoapp/core/models/response/baseResponse.dart';
import 'package:todoapp/core/models/response/responseError.dart';

class LoginResponse extends BaseResponse {
  final String userId;
  final String email;
  final String firstname;
  final AccessToken accessToken;
  final String refreshToken;
  final bool success;
  final List<ResponseError> errors;
  final String message;

  LoginResponse({
    this.userId,
    this.email,
    this.firstname,
    this.accessToken,
    this.refreshToken,
    this.success,
    this.errors,
    this.message}):super(success: success, errors: errors, message: message);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    var errorsList = json['errors'] as List;
    var respErrors = errorsList != null ? errorsList.map((e) => ResponseError.fromJson(e)) : null;

    return LoginResponse(
      userId: json['userId'],
      email: json['email'],
      firstname: json['firstname'],
      accessToken:AccessToken.fromJson(json['accessToken']),
      refreshToken:json['refreshToken'],
      success: json['success'],
      errors: respErrors,
      message: json['message']
    );
  }
}
