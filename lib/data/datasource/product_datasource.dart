import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/model/product.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/screen/home_screen.dart';
import 'package:ecommerce_project/util/api_exception.dart';

abstract class IProductDataSource {
  Future<List<ProductItems>> getProducts();
  Future<List<ProductItems>> getHotest();
  Future<List<ProductItems>> getBestSellerProduct();
}

class ProductDatasource implements IProductDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductItems>> getProducts() async {
    try {
      var response = await _dio.get("collections/products/records");

      if (response.statusCode == 200 && response.data != null) {
        var list =
            response.data['items']
                .map<ProductItems>(
                  (jsonObject) => ProductItems.fromJson(jsonObject),
                )
                .toList();
        return list;
      } else {
        throw ApiException(
          response.statusCode,
          'خطا در دریافت اطلاعات محصولات',
        );
      }
    } on DioException catch (e) {
      throw ApiException(
        e.response?.statusCode,
        e.response?.data['message'] ?? 'خطا در ارتباط با سرور',
      );
    } catch (e) {
      throw ApiException(0, 'خطای ناشناخته');
    }
  }

  @override
  Future<List<ProductItems>> getBestSellerProduct() async {
    Map<String, String> qParams = {"filter": 'popularity="Best Seller"'};

    try {
      var response = await _dio.get(
        "collections/products/records",
        queryParameters: qParams,
      );

      if (response.statusCode == 200 && response.data != null) {
        var list =
            response.data['items']
                .map<ProductItems>(
                  (jsonObject) => ProductItems.fromJson(jsonObject),
                )
                .toList();
        return list;
      } else {
        throw ApiException(response.statusCode, 'خطا در دریافت محصولات پرفروش');
      }
    } on DioException catch (e) {
      throw ApiException(
        e.response?.statusCode,
        e.response?.data['message'] ?? 'خطا در ارتباط با سرور',
      );
    } catch (e) {
      throw ApiException(0, 'خطای ناشناخته');
    }
  }

  @override
  Future<List<ProductItems>> getHotest() async {
    Map<String, String> qParams = {"filter": 'popularity="Hotest"'};
    try {
      var response = await _dio.get(
        "collections/products/records",
        queryParameters: qParams,
      );

      if (response.statusCode == 200 && response.data != null) {
        var list =
            response.data['items']
                .map<ProductItems>(
                  (jsonObject) => ProductItems.fromJson(jsonObject),
                )
                .toList();
        return list;
      } else {
        throw ApiException(response.statusCode, 'خطا در دریافت محصولات داغ');
      }
    } on DioException catch (e) {
      throw ApiException(
        e.response?.statusCode,
        e.response?.data['message'] ?? 'خطا در ارتباط با سرور',
      );
    } catch (e) {
      throw ApiException(0, 'خطای ناشناخته');
    }
  }
}
