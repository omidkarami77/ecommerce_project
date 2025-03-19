import 'package:ecommerce_project/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifier = ValueNotifier(null);
  static final SharedPreferences sharedPreferences = locator.get();
  static void saveToken(String token) async {
    sharedPreferences.setString('access_token', token);
    authChangeNotifier.value = token;
  }

  static String readAuth() {
    return sharedPreferences.getString('access_token') ?? '';
  }

  static void logOut() {
    sharedPreferences.clear();
    authChangeNotifier.value = null;
  }

  static bool isLoggedIn() {
    String token = readAuth();
    return token.isNotEmpty;
  }
}
