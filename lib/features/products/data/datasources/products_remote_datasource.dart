import 'dart:convert';

import 'package:e_commerce_example_flutter/core/errors/exceptions.dart';

import '../../../../core/api/api_config.dart';
import '../../../../core/network/dio_helper.dart';

class ProductsRemoteDatasource {
  Future<Map<String, dynamic>> getProducts([int? page]) async {
    final payload = {
      'perpage': 10,
    };
    if (page != null) {
      payload['page'] = page;
    }
    try {
      final body = await DioHelper.get(ApiConfig.getProducts, payload: payload);
      final bodyMap = jsonDecode(body) as Map;
      final data = bodyMap['data'];
      final lastPage = bodyMap['meta']['last_page'] as int;
      Map<String, dynamic> map = {};
      map['data'] = data as List;
      if (page == null && lastPage > 1) {
        map['nextPage'] = 2;
      } else if (page != null && lastPage - page > 0) {
        map['nextPage'] = page + 1;
      } else {
        map['nextPage'] = null;
      }

      return map;
    } on ServerException catch (e) {
      if (e.statusCode == 422) {
        throw ProductsException();
      }
    }
    throw ServerException();
  }

  Future<Map<String, dynamic>> getProductById(int productId) async {
    try {
      final body = await DioHelper.get(ApiConfig.getProductById + '$productId');
      final bodyMap = jsonDecode(body) as Map;
      final data = bodyMap['data'] as Map<String, dynamic>;
      return data;
    } on ServerException catch (e) {
      throw ProductException(statusCode: e.statusCode);
    } catch (e) {
      throw ServerException();
    }
  }
}
