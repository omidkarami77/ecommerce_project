import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/datasource/category_datasource.dart';
import 'package:ecommerce_project/data/model/category.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Items>>> getCategories();
}

class CategoryyRepository implements ICategoryRepository {
  final ICategoryDataSource _dataSource;

  CategoryyRepository(this._dataSource);

  @override
  Future<Either<String, List<Items>>> getCategories() async {
    try {
      var response = await _dataSource.getCategories();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
