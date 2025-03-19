import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/datasource/authentication_remote.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/util/api_exception.dart';
import 'package:ecommerce_project/util/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAthenticationRepository {
  Future<Either<String, String>> register(
    String username,
    String password,
    String confrimPassword,
  );

  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository implements IAthenticationRepository {
  final IAuthenticationDataSource _datasource = locator.get();
  final SharedPreferences _sharedPreferences = locator.get();

  @override
  Future<Either<String, String>> register(
    String username,
    String password,
    String confrimPassword,
  ) async {
    try {
      await _datasource.register(username, password, confrimPassword);
      return right('ثبت نام انجام شد');
    } on ApiException catch (ex) {
      return left(ex.message!);
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شده اید');
      } else {
        return left('خطایی در ورود پیش آمده! ');
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}

// abstract class IAuthRepository {
//   Future<Either<String, String>> register(
//     String username,
//     String password,
//     String passwordConfirm,
//   );

//   Future<Either<String, String>> login(String username, String password);
// }

// class AuthencticationRepository extends IAuthRepository {
//   final IAuthenticationDataSource _datasource = locator.get();
//   final SharedPreferences _sharedPref = locator.get();
//   @override
//   Future<Either<String, String>> register(
//     String username,
//     String password,
//     String passwordConfirm,
//   ) async {
//     try {
//       await _datasource.register(username, password, passwordConfirm);
//       return right('ثبت نام انجام شد!');
//     } on ApiException catch (ex) {
//       return left(ex.message ?? 'خطا محتوای متنی ندارد');
//     }
//   }

//   @override
//   Future<Either<String, String>> login(String username, String password) async {
//     try {
//       String token = await _datasource.login(username, password);
//       if (token.isNotEmpty) {
//         return right('شما وارد شده اید');
//       } else {
//         return left('خطایی در ورود پیش آمده! ');
//       }
//     } on ApiException catch (ex) {
//       return left('${ex.message}');
//     }
//   }
// }
