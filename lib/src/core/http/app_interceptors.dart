import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';


class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "platform": 'APP',
      "device": Platform.isIOS ? 'IOS' : 'ANDROID',
      "x-api-key":"ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr"
    });

     log("${options.headers}", name: "AppInterceptors: headers");
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    String errorDescription = "";
    switch (err.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription =
            "Ups, en este momento estamos presentando inconvenientes, estamos trabajando para restablecer el servicio";
        break;
      case DioErrorType.other:
        errorDescription = "Ups, parece que no estas conectado a internet";
        log("${err.type} ${err.response?.data['message']}", name: "OnError Diooo");
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        log("ENTRO EN EL CASE RESPONSE", name: "DioErrorType.response");
        errorDescription = "Received invalid status code: ${err.response?.statusCode} ";
        // INVALID_CUSTOMER
        /*const invalidCustomer = "INVALID_CUSTOMER";
        const loginInvalid = "LOGIN_INVALID";
        const invalidUserProfile = "INVALID_USER_PROFILE";
        const userExists = "user_exists";
        //const UNAUTHORIZED = "UNAUTHORIZED";*/
        var code = "";
        if (err.response?.data.containsKey('code')) {
          code = err.response?.data['code'];
        }
        if (err.response?.statusCode == 504) {
          errorDescription =
              "Ups, parece que tenemos problemas para comunicarnos con nuestras bases de datos, intentalo mas tarde";
        }
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
    print("errorDescription:\t$errorDescription");
    err.error = errorDescription;
    return super.onError(err, handler);
  }

}
