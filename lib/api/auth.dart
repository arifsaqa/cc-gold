import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/models/User.dart';

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
}
