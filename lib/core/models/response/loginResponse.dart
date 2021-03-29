
import 'package:todoapp/core/models/response/accessToken.dart';
import 'package:todoapp/core/models/response/baseResponse.dart';
import 'package:todoapp/core/models/response/responseError.dart';

class LoginResponse extends BaseResponse {
  final AccessToken accessToken;
  final String refreshToken;
  final bool success;
  final List<ResponseError> errors;
  final String message;

  LoginResponse({
    this.accessToken,
    this.refreshToken,
    this.success,
    this.errors,
    this.message}):super(success: success, errors: errors, message: message);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        accessToken:AccessToken.fromJson(json['accessToken']),
        refreshToken:json['refreshToken'],
    );
  }
}
