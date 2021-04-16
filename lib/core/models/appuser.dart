import 'package:flutter/material.dart';

class AppUser{
  final String id;
  final String email;
  final String firstname;
  String accessToken;
  String refreshToken;
  bool authenticated = false;


  AppUser({
    @required this.id,
    @required this.email,
    @required this.firstname,
    @required this.accessToken,
    @required this.refreshToken,
    @required this.authenticated
  });

  static AppUser initial(){
    var initialUser = AppUser
      (
        id: null,
        email: null,
        firstname: null,
        accessToken: null,
        refreshToken: null,
        authenticated: false
      );

    return initialUser;
  }

  @override
  String toString() => "AppUSer{firstname: $firstname, id: $id, firstname: $firstname, email: $email }";


}