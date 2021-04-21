
import 'package:todoapp/core/models/response/baseResponse.dart';
import 'package:todoapp/core/models/response/responseError.dart';
import 'package:todoapp/core/models/response/userResponse.dart';

class GetUserResponse extends BaseResponse{
  final UserResponse? userResponse;
  final bool? success;
  final List<ResponseError>? errors;
  final String? message;

  GetUserResponse({
    this.userResponse,
    this.success,
    this.errors,
    this.message}):super(success: success, errors: errors, message: message);

  factory GetUserResponse.fromJson(Map<String, dynamic> json){
    return GetUserResponse(
      userResponse: UserResponse.fromJson(json['user'])
    );
  }
}