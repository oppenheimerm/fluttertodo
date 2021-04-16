
import 'package:flutter/foundation.dart';
import 'package:todoapp/core/models/response/responseError.dart';

class BaseResponse{
  final bool success;
  final List<ResponseError> errors;
  final String message;

  BaseResponse({@required this.success, @required this.errors, @required this.message});

}