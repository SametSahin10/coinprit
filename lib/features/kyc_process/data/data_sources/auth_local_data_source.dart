import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  const AuthLocalDataSource({required this.sharedPreferences});

  static const accessTokenSharedPrefsKey = "accessToken";

  String? getAccessToken() => sharedPreferences.get("accessToken") as String?;

  Future<bool> saveAccessToken(String accessToken) {
    return sharedPreferences.setString(accessTokenSharedPrefsKey, accessToken);
  }
}
