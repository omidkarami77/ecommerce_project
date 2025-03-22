import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/datasource/banner_datasource.dart';
import 'package:ecommerce_project/data/model/banner.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerItems>>> getBanners();
}

class BannerRepository implements IBannerRepository {
  final IBannerDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<BannerItems>>> getBanners() async {
    try {
      var response = await _dataSource.getBanners();

      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد ');
    }
  }
}
