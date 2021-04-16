import 'package:flutter/material.dart';
import 'package:todoapp/core/models/response/getUserResponse.dart';
import 'package:todoapp/core/models/response/loginResponse.dart';
import 'package:todoapp/core/models/response/refreshTokenResponse.dart';
import 'package:todoapp/core/models/response/registerResponse.dart';
import 'package:todoapp/core/models/response/userResponse.dart';

abstract class IAuthenticationService{
  //bool isLoggedIn();

  Future<LoginResponse> login({
    @required String email,
    @required String password
  });

  Future<RegisterResponse> register({
    @required String email,
    @required String password,
    @required String firstname
  });

  Future<UserResponse> getUser();

  Future<RefreshTokenResponse> refreshToken({
    @required String refreshToken
  });



}