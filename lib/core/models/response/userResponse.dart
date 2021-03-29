import 'package:flutter/material.dart';

class UserResponse {
  String id;
  String email;
  String firstname;

  UserResponse({this.id, this.email, this.firstname});

  factory UserResponse.fromJson(Map<String, dynamic>json){
    return UserResponse(
        id: json['userID'],
        firstname: json['firstName'],
        email: json['email']
    );
  }
}