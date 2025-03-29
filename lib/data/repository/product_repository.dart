import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/datasource/product_datasource.dart';
import 'package:ecommerce_project/data/model/product.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';
import 'package:ecommerce_project/widgets/product_item.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductItems>>> getProducts();
  Future<Either<String, List<ProductItems>>> getBestSellerProduct();
  Future<Either<String, List<ProductItems>>> getHotest();
}

class ProductRepository implements IProductRepository {
  final IProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductItems>>> getProducts() async {
    // TODO: implement getProducts

    try {
      var response = await _dataSource.getProducts();

      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductItems>>> getBestSellerProduct() async {
    // TODO: implement getBestSellerProduct

    try {
      var response = await _dataSource.getBestSellerProduct();

      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductItems>>> getHotest() async {
    // TODO: implement getHotest

    try {
      var response = await _dataSource.getHotest();
      print(response.toString());
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
