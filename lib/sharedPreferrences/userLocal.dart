import 'package:shared_preferences/shared_preferences.dart';

class LocalUser {
  Future<void> setLocalUser(
      {required String phoneNumber,
      required int userId,
      required String token}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("phoneNumber", phoneNumber);
    pref.setInt("userId", userId);
    pref.setString("token", token);
  }

  Future<String> getDeviceId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString("isSignin") ?? "";
  }

  Future<int> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getInt("userId") ?? 0;
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString("token");
  }
}
