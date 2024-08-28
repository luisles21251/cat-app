import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? title;
  final String? message;
  final String? code;

  const Failure({this.message = "Undefined error", this.title = "Unknown", this.code});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  final int? statusCode;
  final Map? data;
  final DioError? error;
  @override
  final String? code;

  /*
  {
  "code": "string",
  "description": "string",
  "statusCode": 0,
  "path": "string"
}
   */

  const ServerFailure({this.title, this.error, this.message, this.data, this.statusCode, this.code});

  ServerFailure get extract {
    String title = '';
    String message = '';
    int? statusCode;
    Map data;
    String code = "";
    statusCode = error?.response?.statusCode;
    if (error?.response?.data is Map) {
      if (error?.response?.data.containsKey('description')) {
        message = error?.response?.data['description'];
        title = error?.response?.data['title'];
      }
    } else if (error?.error is String) {
      message = error?.error;
    } else if (error?.response?.data is String) {
      message = error?.response?.data;
    }
    log("$error", name: "Error");
    log("${error?.response}", name: "Error response");
    if (error != null && error?.response != null && error?.response?.data.containsKey('code')) {
      code = error?.response?.data['code'];
    }

    switch (error?.error.runtimeType) {
      case Map:
        break;
      case String:
        // log(error?.error?.toString() ?? '', name: 'error');
        break;
    }

    if (error?.response?.data is String) {
      data = {"data": error?.response?.data?.toString()};
    } else if (error?.response?.data is Map) {
      data = error?.response?.data;
    } else {
      data = {"data": error?.response?.data?.toString()};
    }

    String pattern = r'(\<\w*)((\s\/\>)|(.*\<\/\w*\>))';
    RegExp regExp = RegExp(pattern);

    if (regExp.hasMatch(message)) message = 'Http status error [$statusCode]';

    log(error.toString(), name: 'error');
    log(statusCode.toString(), name: 'statusCode');
    log(message.toString(), name: 'message');
    log(data.toString(), name: 'data');

    return ServerFailure(
        title: title,
        error: error,
        message: message,
        data: data,
        statusCode: statusCode,
        code: code);
  }
}

class CacheFailure extends Failure {
  final dynamic error;
  @override
  final String? message;

  const CacheFailure([this.error, this.message]);

  CacheFailure get get {
    String message = error.toString();
    log(message, name: 'DatabaseException');
    return CacheFailure(error, message);
  }
}
