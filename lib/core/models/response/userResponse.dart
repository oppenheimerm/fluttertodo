import 'package:flutter/material.dart';
import 'package:todoapp/core/models/response/baseResponse.dart';
import 'package:todoapp/core/models/response/responseError.dart';

class UserResponse extends BaseResponse {
  String email;
  String firstname;
  String id;
  final bool success;
  final List<ResponseError> errors;
  final String message;


  UserResponse({
    this.email,
    this.firstname,
    this.id,
    this.success,
    this.errors,
    this.message}):super(success: success, errors: errors, message: message);

  factory UserResponse.fromJson(Map<String, dynamic>json){
    return UserResponse(
      email: json['email'],
      firstname: json['firstname'],
      id: json['userId'],
    );
  }
}