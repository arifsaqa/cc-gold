import 'package:shared_preferences/shared_preferences.dart';

class LocalUser {
  Future<void> setLocalUser(bool isSignin, int userId, String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("isSignin", isSignin);
    pref.setInt("userId", userId);
    pref.setString("token", token);
  }

  Future<bool> getIsSignin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getBool("isSignin") ?? false;
  }

  Future<int> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getInt("userId") ?? 0;
  }

  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString("token") ?? "";
  }
}
