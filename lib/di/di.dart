import 'package:dio/dio.dart';
import 'package:ecommerce_project/data/datasource/authentication_remote.dart';
import 'package:ecommerce_project/data/repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: 'https://startflutter.ir/api/')),
  );

  locator.registerFactory<IAthenticationRepository>(
    () => AuthenticationRepository(),
  );
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  locator.registerFactory<IAuthenticationDataSource>(
    () => AuthenticationRemote(),
  );
}
