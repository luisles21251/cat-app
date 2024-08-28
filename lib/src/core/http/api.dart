
import 'package:cat_flutter_project/src/core/env/env.dart';
import 'package:cat_flutter_project/injecction_container.dart';
import 'package:dio/dio.dart';
import 'app_interceptors.dart';

class ApiProvider {
  final String _baseApiUrl = sl<Env>().api;
  late Dio dio;

  ApiProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseApiUrl));
    dio.interceptors.add(AppInterceptors());
  }
}
