import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../models/user_model.dart';
import '../../../core/constants/app_constants.dart';

class LocalStorageDataSource {
  final SharedPreferences sharedPreferences;

  LocalStorageDataSource({required this.sharedPreferences});

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString(AppConstants.authToken, token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.authToken);
  }

  Future<void> clearToken() async {
    await sharedPreferences.remove(AppConstants.authToken);
  }

  Future<void> saveUser(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    await sharedPreferences.setString('current_user', userJson);
  }

  Future<UserModel?> getUser() async {
    final userJson = sharedPreferences.getString('current_user');
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<void> clearUser() async {
    await sharedPreferences.remove('current_user');
  }
}
