import 'package:flutter/material.dart';

class AppUser{
  final String id;
  final String email;
  final String firstname;
  final String accessToken;
  final String refreshToken;


  const AppUser({
    @required this.id,
    @required this.email,
    @required this.firstname,
    @required this.accessToken,
    @required this.refreshToken,
  });

  static AppUser initial(){
    var initialUser = AppUser
      (
        id: null,
        email: null,
        firstname: null,
        accessToken: null,
        refreshToken: null
      );

    return initialUser;
  }

  @override
  String toString() => "AppUSer{firstname: $firstname, id: $id, firstname: $firstname, email: $email }";


}