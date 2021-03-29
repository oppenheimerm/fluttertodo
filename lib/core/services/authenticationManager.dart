import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:todoapp/core/models/appuser.dart';
import 'package:todoapp/core/models/response/getUserResponse.dart';
import 'package:todoapp/core/models/response/loginResponse.dart';
import 'package:todoapp/core/models/response/registerResponse.dart';
import 'package:todoapp/core/services/IAuthenticationService.dart';


class AuthenticationManager implements IAuthenticationService{

  static const endpoint = 'https://localhost:5001/';
  StreamController<AppUser> userStreamController;

  AuthenticationManager(){
    userStreamController = StreamController<AppUser>();
  }


  //  The http.Response class contains the data received from a successful http call.
  Future<RegisterResponse> register({
    @required String email,
    @required String password,
    @required String firstname
  }) async
  {
    final response = await http.post(
      Uri.https(endpoint, '/api/account/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email":email,
        "password":password,
        "firstname": firstname
      }),
    );
    if(response.statusCode == 201){
      //  OK, parse jason response
      return RegisterResponse.fromJson(jsonDecode(response.body));
    }else if(response.statusCode == 400){
      // validation error with email, password, or firstname
      return new RegisterResponse(
          id:'',
          success: false,
          errors: null,
          message: "Error detected with email, password, or firstname"
      );
    }else{
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //  Rather than throwing an exception capture the response,
      //  that the server will return
      //throw Exception('Failed to load album');
      return RegisterResponse.fromJson(jsonDecode(response.body));
      //  The above will include status and any other errors encountered
    }
  }

  Future<LoginResponse> login({
    @required String email,
    @required String password
  }) async
  {

    final response = await http.post(
      Uri.https('todoflutterwebapideploy.azurewebsites.net','/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email":email,
        "password":password
      }),
    );
    if(response.statusCode == 201){
      //  OK, parse jason response
      //userStreamController.add(_appUser);
      return LoginResponse.fromJson(jsonDecode(response.body));
    }else if(response.statusCode == 400){
      // validation error with email or password
      return new LoginResponse(
          accessToken: null,
          refreshToken: '',
          success: false,
          errors: null,
          message: "Error detected with email or password"
      );
    }else{
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //  Rather than throwing an exception capture the response,
      //  that the server will return
      //throw Exception('Failed to load album');
      return LoginResponse(
        accessToken: null,
        refreshToken: '',
        success: false,
        message: response.statusCode.toString() + "" + response.reasonPhrase
      );
      //  The above will include status and any other errors encountered
    }
  }

  Future<GetUserResponse> getUser({
    @required String accessToken,
    @required String refreshToken
  }) async
  {
    final response = await http.post(
      Uri.https(endpoint, '/api/account/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "accesstoken":accessToken,
        "refreshtoken":refreshToken
      }),
    );
    if(response.statusCode == 201){
      //  OK, parse jason response

      //userStreamController.add(_appUser);
      return GetUserResponse.fromJson(jsonDecode(response.body));
    }else if(response.statusCode == 400){
      // validation error with email or password
      return new GetUserResponse(
          userResponse: null,
          success: false,
          errors: null,
          message: "Error access token and refresh token are requires"
      );
    }else{
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //  Rather than throwing an exception capture the response,
      //  that the server will return
      //throw Exception('Failed to load album');
      return GetUserResponse.fromJson(jsonDecode(response.body));
      //  The above will include status and any other errors encountered
    }
  }


}