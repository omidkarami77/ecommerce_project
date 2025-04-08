import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/model/banner.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';

abstract class IBannerDataSource {
  Future<List<BannerItems>> getBanners();
}

class BannerDatasource implements IBannerDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<BannerItems>> getBanners() async {
    // TODO: implement getBanners

    try {
      final response = await _dio.get("collections/banner/records");

      var list =
          response.data['items']
              .map<BannerItems>((json) => BannerItems.fromJson(json))
              .toList();

      return list;
    } on DioException catch (e) {
      throw ApiException(e.response!.statusCode, e.response!.data['message']);
    } catch (e) {
      throw ApiException(0, 'unkown error');
    }
  }
}
