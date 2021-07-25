import 'package:shared_preferences/shared_preferences.dart';

class LocalUser {
  Future<void> setLocalUser(bool isSignin, int userId, String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setInt("userId", userId);
    pref.setString("token", token);
    pref.setString("deviceId", token);
  }

  Future<String> getDeviceId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString("isSignin") ?? "";
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
