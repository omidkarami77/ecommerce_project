import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/datasource/product_detail_datasource.dart';
import 'package:ecommerce_project/data/model/gallery.dart';
import 'package:ecommerce_project/data/model/product_variant.dart';
import 'package:ecommerce_project/data/model/variant_type.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<ProductImageItems>>> getGallery();
  Future<Either<String, List<VariantTypeItems>>> getVariants();
  Future<Either<String, List<ProductVariant>>> getProductVariants();
}

class ProductDetailRepository implements IProductDetailRepository {
  final IProductDetailDataSource _dataSource = locator.get();

  @override
  Future<Either<String, List<ProductImageItems>>> getGallery() async {
    // TODO: implement getGallery

    try {
      var response = await _dataSource.getGallery();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantTypeItems>>> getVariants() async {
    try {
      var response = await _dataSource.getVariantTypes();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVariants() async {
    try {
      var response = await _dataSource.getProductVariants();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
