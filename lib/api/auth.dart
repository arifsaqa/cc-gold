import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/models/User.dart';
import 'package:learnUI/models/cekToken.dart';

class AuthFunctions {
  static Future<UserData?> login(String phone, String password) async {
    var apiResult = await http.post(Uri.parse(AuthURL().login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({"phone": phone, "password": password}));

    if (apiResult.statusCode == 200) {
      dynamic jsonObject = json.decode(apiResult.body);
      return UserData.fromJson(jsonObject as Map<String, dynamic>);
      //d
    } else {
      //show shit
      return null;
    }
  }

  static Future<IsTokenValid?> checkToken(String token) async {
    // print(token);
    var apiResult = await http.get(
      Uri.parse(AuthURL().checkToken),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(apiResult.statusCode);
    if (apiResult.statusCode == 200) {
      dynamic jsonObject = json.decode(apiResult.body);
      return IsTokenValid.fromJson(jsonObject as Map<String, dynamic>);
      //d
    } else {
      //show shit
      return null;
    }
  }

  static Future<User> getUserById(int id) async {
    var apiResult =
        await http.get(Uri.parse(AuthURL().getUserById + id.toString()));
    dynamic jsonObject = json.decode(apiResult.body);
    return User.fromJson(jsonObject as Map<String, dynamic>);
  }
}
