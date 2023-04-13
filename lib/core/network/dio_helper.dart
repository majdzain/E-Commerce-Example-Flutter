import 'package:dio/dio.dart';
import 'package:e_commerce_example_flutter/core/cache/cache_helper.dart';

import '../api/api_config.dart';
import '../errors/exceptions.dart';

class DioHelper {
  static late Dio _dio;
  static String? _token;

  static Future<void> init() async {
    _dio = Dio();
    if (CacheHelper.containsKey('token')) {
      _token = CacheHelper.getString('token');
    }
    _initApiClient();
  }

  static void _initApiClient() {
    if (_token != null) {
      _dio.options.headers["Authorization"] = "Bearer $_token";
    }
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.baseUrl = ApiConfig.baseUrl;
    _dio.options.responseType = ResponseType.plain;
    _dio.options.connectTimeout = const Duration(seconds: 10);
  }

  static bool get isLoggedIn {
    return _token != null;
  }

  static Future<void> setToken(String token) async {
    await CacheHelper.setString('token', token);
    _token = token;
    _dio.options.headers["Authorization"] = "Bearer $_token";
  }

  static void removeToken() {
    CacheHelper.remove('token');
    _token = null;
    _dio.options.headers["Authorization"] = null;
  }

  static Future<String> get(String url, {Map<String, dynamic>? payload}) async {
    try {
      final response = await _dio.get(url, queryParameters: payload);
      if (response.statusCode != 200) {
        throw ServerException(
            statusCode: response.statusCode, error: response.data);
      }
      return response.data;
    } on DioError catch (e) {
      print(e.response?.data);
      print('GET error Connection Exception => ${e.message}');
      throw ServerException(
          statusCode: e.response?.statusCode, error: e.response?.data);
    }
  }

  static Future<dynamic> post(String url,
      {Map<String, dynamic>? payload}) async {
    try {
      final response = await _dio.post(url, queryParameters: payload);
      if (response.statusCode != 200) {
        throw ServerException(
            statusCode: response.statusCode, error: response.data);
      }
      return response.data;
    } on DioError catch (e) {
      print('POST error Connection Exception => ${e.message}');
      throw ServerException(
          statusCode: e.response?.statusCode, error: e.response?.data);
    }
  }

  static Future<dynamic> put(String url,
      {Map<String, dynamic>? payload}) async {
    try {
      final response = await _dio.put(url, queryParameters: payload);
      if (response.statusCode != 200) {
        throw ServerException(
            statusCode: response.statusCode, error: response.data);
      }
      return response.data;
    } on DioError catch (e) {
      print('PUT error Connection Exception => ${e.message}');
      throw ServerException(
          statusCode: e.response?.statusCode, error: e.response?.data);
    }
  }

  static Future<dynamic> delete(String url,
      {Map<String, dynamic>? payload}) async {
    try {
      final response = await _dio.delete(url, queryParameters: payload);
      if (response.statusCode != 200) {
        throw ServerException(
            statusCode: response.statusCode, error: response.data);
      }
      return response.data;
    } on DioError catch (e) {
      print('DELETE error Connection Exception => ${e.message}');
      throw ServerException(
          statusCode: e.response?.statusCode, error: e.response?.data);
    }
  }
}
