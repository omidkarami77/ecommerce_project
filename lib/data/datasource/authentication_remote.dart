import 'package:dio/dio.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';

abstract class IAuthenticationDataSource {
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  );

  Future<String> login(String username, String password);
}

class AuthenticationRemote implements IAuthenticationDataSource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      final response = await _dio.post(
        'collections/users/records',

        data: {
          'username': username,

          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown eeror');
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      var response = await _dio.post(
        'collections/users/auth-with-password',
        data: {'identity': username, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
    return '';
  }
}
