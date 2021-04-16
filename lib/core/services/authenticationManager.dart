import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:todoapp/core/enums/apptypes.dart';
import 'package:todoapp/core/models/appuser.dart';
import 'package:todoapp/core/models/response/accessToken.dart';
import 'package:todoapp/core/models/response/loginResponse.dart';
import 'package:todoapp/core/models/response/refreshTokenResponse.dart';
import 'package:todoapp/core/models/response/registerResponse.dart';
import 'package:todoapp/core/models/response/userResponse.dart';
import 'package:todoapp/core/services/IAuthenticationService.dart';
import 'package:todoapp/core/services/securestore.dart';


class AuthenticationManager implements IAuthenticationService{

  static const endpoint = 'todoflutterwebapi.azurewebsites.net';
  StreamController<AppUser> userStreamController;
  SecureStore _secureStore;

  AuthenticationManager(){
    userStreamController = StreamController<AppUser>();
    _secureStore = SecureStore();
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
      Uri.https(endpoint,'api/account/authenticate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email":email,
        "password":password
      }),
    );
    if(response.statusCode == 200){
      //  OK, parse jason response
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      var user = AppUser(
          id: loginResponse.userId,
          email: email,
          firstname: loginResponse.firstname,
          accessToken: loginResponse.accessToken.token, 
          refreshToken: loginResponse.refreshToken,
          authenticated: true
      );

      await _secureStore.setLoginStorageValues(
          loginResponse.accessToken.token,
          loginResponse.refreshToken,
          email,
          user.id,
          user.firstname
      );
      userStreamController.add(user);

      return LoginResponse.fromJson(jsonDecode(response.body));
    }else if(response.statusCode == 400){
      // validation error with email or password
      return new LoginResponse(
          email: '',
          firstname: '',
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
        email: '',
        firstname: '',
        accessToken: null,
        refreshToken: '',
        success: false,
        message: response.statusCode.toString() + "" + response.reasonPhrase
      );
      //  The above will include status and any other errors encountered
    }
  }


  Future<RefreshTokenResponse> refreshToken({
    @required String refreshToken
  }) async
  {

    final response = await http.post(
      Uri.https(endpoint,'api/account/refreshtoken'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "refreshtoken":refreshToken
      }),
    );
    if(response.statusCode == 200){
      //  OK, parse jason response
      var refreshTokenResponse = RefreshTokenResponse.fromJson(jsonDecode(response.body));
      return refreshTokenResponse;
    }else if(response.statusCode == 400){
      // Either bad request or token expired
      return new RefreshTokenResponse(
        accessToken: AccessToken.EmptyAccessToken(),
        refreshToken: "",
        success: false,
        errors: null,
        message: "badly formed request / or refresh token expired"
      );
    }else{
      return new RefreshTokenResponse(
          accessToken: AccessToken.EmptyAccessToken(),
          refreshToken: "",
          success: false,
          errors: null,
          message: "General error"
      );
    }
  }

  /// Get's instance of [AppUser] from server using the key / value
  /// of [TokenType.accessToken] and [TokenType.refreshToken].
  Future<UserResponse> getUser() async
  {
    var accessToken = await _secureStore.getValue(StorageType.storageAccessToken.toString());
    var userId = await _secureStore.getValue(StorageType.storageUserId.toString());
    var refreshToken = await _secureStore.getValue(StorageType.storageRefreshToken.toString());

    //  null storage values?
    if(accessToken == null || userId == null || refreshToken == null){
      //  user is not logged in so just return the GetUserResponse
      return new UserResponse(
        email: "",
          firstname: "",
          id: "",
          success: false,
          errors: null,
          message:"No access or refresh tokens present"
      );

    }

    final response = await http.get(
      Uri.https(endpoint, '/api/account/user', {"userid":userId}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      });
    if(response.statusCode == 200){
      //  OK, parse jason response
      var userResponse = UserResponse.fromJson(jsonDecode(response.body));
      return new UserResponse(
        email: userResponse.email,
        firstname: userResponse.firstname,
        id: userResponse.id,
        success: true,
        errors: null,
        message: "successfully retrieved user details"
      );
    }else if(response.statusCode == 400){
      //  shouldn't really have a 400 error
      return new UserResponse(
          email: "",
          firstname: "",
          id: "",
          success: false,
          errors: null,
          message: "Error access token and refresh token are requires"
      );
    }else if(response.statusCode == 401){
      //  try refresh token
      var refreshRequestResponse = await this.refreshToken(refreshToken: refreshToken);

      if(refreshRequestResponse.success)
        {
          //  updateTokens
          await _secureStore.updateTokens(
              refreshRequestResponse.accessToken.token,
              refreshRequestResponse.refreshToken
          );
          var id = await _secureStore.getValue(StorageType.storageUserId.toString());
          var firstName = await _secureStore.getValue(StorageType.storageFirstname.toString());
          var email = await _secureStore.getValue(StorageType.storageEmail.toString());

          return new UserResponse(
              email: email,
              firstname: firstName,
              id: id,
              success: true,
              errors: null,
              message: "Successfully refreshed tokens"
          );

        }else{
        return new UserResponse(
            email: "",
            firstname: "",
            id: "",
            success: false,
            errors: null,
            message: "Failed to refresh tokens"
        );
      }
    }else{
      return new UserResponse(
          email: "",
          firstname: "",
          id: "",
          success: false,
          errors: null,
          message: "Failed to get user"
      );
    }
  }


}