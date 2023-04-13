import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_example_flutter/core/errors/exceptions.dart';
import 'package:e_commerce_example_flutter/core/network/dio_helper.dart';

import '../../../../core/api/api_config.dart';

class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final payload = {
      'email': email,
      'password': password,
    };
    try {
      final body = await DioHelper.post(ApiConfig.login, payload: payload);
      final map = jsonDecode(body) as Map;
      final token = map['token'] as String;
      final userMap = map['user'] as Map<String, dynamic>;
      DioHelper.setToken(token);
      return userMap;
    } on ServerException catch (e) {
      if (e.statusCode == 422) {
        List<String>? messages;
        if (e.error != null) {
          Map errorJson = jsonDecode(e.error!)['errors'];
          messages = errorJson['email']?.cast<String>();
          throw LoginException(messages: messages);
        }
      }
    }
    throw ServerException();
  }

  Future<Unit> logout() async {
    try {
      final body = await DioHelper.post(ApiConfig.logout);
      DioHelper.removeToken();
      return unit;
    } on ServerException catch (e) {
      if (e.statusCode == 401) {
        throw UnauthenticatedException();
      }
    }
    throw ServerException();
  }

  Future<Map<String, dynamic>> register(String email, String name,
      String password, String passwordConfirmation) async {
    final payload = {
      'email': email,
      'name': name,
      'password': password,
      'password_confirmation': passwordConfirmation
    };
    try {
      final body = await DioHelper.post(ApiConfig.register, payload: payload);
      final map = jsonDecode(body) as Map;
      final token = map['token'] as String;
      final userMap = map['user'] as Map<String, dynamic>;
      DioHelper.setToken(token);
      return userMap;
    } on ServerException catch (e) {
      if (e.statusCode == 422) {
        List<String>? messages;
        if (e.error != null) {
          messages = [];
          Map errorJson = jsonDecode(e.error!)['errors'];
          if (errorJson.containsKey('email')) {
            messages.addAll(errorJson['email'].cast<String>());
          }
          if (errorJson.containsKey('password')) {
            messages.addAll(errorJson['password'].cast<String>());
          }
          throw RegisterException(messages: messages);
        }
      }
    }
    throw ServerException();
  }

  Future<Map<String, dynamic>> checkToken() async {
    try {
      final body = await DioHelper.get(ApiConfig.checkToken);
      final map = jsonDecode(body) as Map;
      final userMap = map['user'] as Map<String, dynamic>;
      return userMap;
    } on ServerException catch (e) {
      if (e.statusCode == 401) {
        throw UnauthenticatedException();
      }
    }
    throw ServerException();
  }
}
