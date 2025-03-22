import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/model/category.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';
import 'package:flutter/foundation.dart';

abstract class ICategoryDataSource {
  Future<List<Items>> getCategories();
}

class CategoryDatasource implements ICategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Items>> getCategories() async {
    // TODO: implement getCategories

    try {
      final response = await _dio.get('collections/category/records');
      // print("Response Data: ${response.data}");

      var list =
          response.data['items']
              .map<Items>((jsonObject) => Items.fromJson(jsonObject))
              .toList();

      print(list);

      return list;
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'unkown error');
    }
  }
}
