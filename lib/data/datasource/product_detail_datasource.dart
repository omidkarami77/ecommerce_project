import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/model/gallery.dart';
import 'package:ecommerce_project/data/model/product_variant.dart';
import 'package:ecommerce_project/data/model/variant.dart';
import 'package:ecommerce_project/data/model/variant_type.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';

abstract class IProductDetailDataSource {
  Future<List<ProductImageItems>> getGallery(String productId);
  Future<List<VariantTypeItems>> getVariantTypes();
  Future<List<Variant>> getVariants();
  Future<List<ProductVariant>> getProductVariants();
}

class ProductDetailDatasource implements IProductDetailDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImageItems>> getGallery(String productId) async {
    // TODO: implement getGallery
    Map<String, String> qParams = {"filter": 'product_id="${productId}"'};

    try {
      var response = await _dio.get(
        "collections/gallery/records",
        queryParameters: qParams,
      );

      if (response.statusCode == 200 && response.data != null) {
        var list =
            response.data['items']
                .map<ProductImageItems>(
                  (jsonObject) => ProductImageItems.fromJson(jsonObject),
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
  Future<List<VariantTypeItems>> getVariantTypes() async {
    // TODO: implement getVariantTypes

    try {
      var response = await _dio.get("collections/variants_type/records");

      if (response.statusCode == 200 && response.data != null) {
        var list =
            response.data['items']
                .map<VariantTypeItems>(
                  (jsonObject) => VariantTypeItems.fromJson(jsonObject),
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
  Future<List<Variant>> getVariants() async {
    try {
      Map<String, String> qParams = {"filter": 'product_id="at0y1gm0t65j62j"'};

      var response = await _dio.get(
        "collections/variants/records",
        queryParameters: qParams,
      );

      if (response.statusCode == 200 && response.data != null) {
        var list =
            response.data['items']
                .map<Variant>((jsonObject) => Variant.fromJson(jsonObject))
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
  Future<List<ProductVariant>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();

    var variantList = await getVariants();
    List<ProductVariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      var productVarinatList =
          variantList
              .where((element) => element.typeId == variantType.id)
              .toList();

      productVariantList.add(ProductVariant(variantType, variantList));
    }
    return productVariantList;
  }
}
