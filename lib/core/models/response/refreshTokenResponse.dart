import 'package:todoapp/core/models/response/accessToken.dart';
import 'package:todoapp/core/models/response/baseResponse.dart';
import 'package:todoapp/core/models/response/responseError.dart';

class RefreshTokenResponse extends BaseResponse{

  final AccessToken? accessToken;
  final String? refreshToken;
  final bool? success;
  final List<ResponseError>? errors;
  final String? message;

  RefreshTokenResponse({
    this.accessToken,
    this.refreshToken,
    this.success,
    this.errors,
    this.message
  }):super(success: success, errors: errors, message: message);

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    var errorsList = json['errors'] as List?;
    /*var respErrors = errorsList != null ? errorsList.map((e) =>
        ResponseError.fromJson(e)) : null;*/
    var respErrors = errorsList?.map((e) => ResponseError.fromJson(e));

    return RefreshTokenResponse(
        accessToken:AccessToken.fromJson(json['accessToken']),
        refreshToken:json['refreshToken'],
        success: json['success'],
        errors: respErrors?.toList(),
        message: json['message']
    );
  }
}