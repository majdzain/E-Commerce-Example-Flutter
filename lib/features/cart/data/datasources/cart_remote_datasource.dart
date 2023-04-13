import 'dart:convert';

import 'package:e_commerce_example_flutter/core/api/api_config.dart';
import 'package:e_commerce_example_flutter/core/errors/exceptions.dart';
import 'package:e_commerce_example_flutter/core/network/dio_helper.dart';

class CartRemoteDatasource {
  Future<Map<String, dynamic>> addToCart(int productId, int quantity) async {
    final payload = {'product_id': productId, 'quantity': quantity};
    try {
      final body = await DioHelper.put(ApiConfig.addToCart, payload: payload);
      final bodyMap = jsonDecode(body) as Map;
      final data = bodyMap['data'] as Map<String, dynamic>;
      return data;
    } on ServerException catch (e) {
      if (e.statusCode == 401) {
        throw UnauthenticatedException();
      } else if (e.statusCode == 422) {
        throw ProductException(statusCode: e.statusCode);
      }
    }
    throw ServerException();
  }

  Future<Map<String, dynamic>> getCart() async {
    try {
      final body = await DioHelper.get(ApiConfig.getCart);
      final bodyMap = jsonDecode(body) as Map;
      final data = bodyMap['data'] as Map<String, dynamic>;
      return data;
    } on ServerException catch (e) {
      if (e.statusCode == 401) {
        throw UnauthenticatedException();
      }
    }
    throw ServerException();
  }

  Future<Map<String, dynamic>> removeFromCart(int productId) async {
    final payload = {'product_id': productId};
    try {
      final body =
          await DioHelper.delete(ApiConfig.removeFromCart, payload: payload);
      final bodyMap = jsonDecode(body) as Map;
      final data = bodyMap['data'] as Map<String, dynamic>;
      return data;
    } on ServerException catch (e) {
      if (e.statusCode == 401) {
        throw UnauthenticatedException();
      } else if (e.statusCode == 422) {
        throw ProductException(statusCode: e.statusCode);
      }
    }
    throw ServerException();
  }
}
