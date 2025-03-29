import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/datasource/authentication_remote.dart';
import 'package:ecommerce_project/data/datasource/banner_datasource.dart';
import 'package:ecommerce_project/data/datasource/category_datasource.dart';
import 'package:ecommerce_project/data/datasource/product_datasource.dart';
import 'package:ecommerce_project/data/repository/authentication_repository.dart';
import 'package:ecommerce_project/data/repository/banner_repository.dart';
import 'package:ecommerce_project/data/repository/categoryy_repository.dart';
import 'package:ecommerce_project/data/repository/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://startflutter.ir/api/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    ),
  );

  locator.registerFactory<IProductDataSource>(() => ProductDatasource());

  locator.registerFactory<IBannerDataSource>(() => BannerDatasource());

  locator.registerFactory<IBannerRepository>(() => BannerRepository());

  locator.registerFactory<IAthenticationRepository>(
    () => AuthenticationRepository(),
  );
  locator.registerFactory<ICategoryDataSource>(() => CategoryDatasource());
  locator.registerFactory<ICategoryRepository>(
    () => CategoryyRepository(locator.get()),
  );
  locator.registerFactory<IProductRepository>(() => ProductRepository());
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  locator.registerFactory<IAuthenticationDataSource>(
    () => AuthenticationRemote(),
  );
}
