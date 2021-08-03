import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/models/bank_account/bank_accounts.dart';
import 'package:learnUI/models/cekToken.dart';
import 'package:learnUI/models/saldo/saldo_response.dart';
import 'package:learnUI/models/user/user.dart';
import 'package:learnUI/models/user/user_response.dart';

class AuthFunctions {
  static Future<UserResponse?> login(String phone, String password) async {
    var apiResult = await http.post(Uri.parse(AuthURL().login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({"phone": phone, "password": password}));

    if (apiResult.statusCode == 200) {
      dynamic jsonObject = json.decode(apiResult.body);
      return UserResponse.fromJson(jsonObject as Map<String, dynamic>);
      //d
    } else {
      //show shit
      return null;
    }
  }

// {
//   "name":"Gotou",
//   "email":"gotou@gmail.com ",
//   "password":"111222",
//   "phone":"082332435833",
//   "image":"ddd",
//   "deviceId":"Lennovo asu"
// }
  static Future<UserResponse?> register(
      {required String name,
      required String email,
      required String bankAccount,
      required String phone,
      String? image,
      required String deviceId,
      required String password}) async {
    var apiResult = await http.post(Uri.parse(AuthURL().register),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
          "image": image != null ? image : "unset",
          "deviceId": deviceId
        }));

    print(apiResult.statusCode);
    print(apiResult.body);
    if (apiResult.statusCode == 200) {
      dynamic jsonObject = await json.decode(apiResult.body);
      return UserResponse.fromJson(jsonObject as Map<String, dynamic>);
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

  static Future<String?> logout(String token) async {
    // print(token);
    var apiResult = await http.get(
      Uri.parse(AuthURL().logout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(apiResult.statusCode);
    if (apiResult.statusCode == 200) {
      return 'oke';
      //d
    } else {
      //show shit
      return null;
    }
  }

  static Future<User?> getUserById(int id) async {
    var apiResult =
        await http.get(Uri.parse(AuthURL().getUserById + id.toString()));
    print(apiResult.body);
    dynamic jsonObject = json.decode(apiResult.body);
    return User.fromJson(jsonObject as Map<String, dynamic>);
  }

  static Future<SaldoResponse> getUserSaldo(int userId) async {
    var apiResult =
        await http.get(Uri.parse(UsersData().userSaldo + userId.toString()));
    dynamic jsonObject = json.decode(apiResult.body);
    return SaldoResponse.fromJson(jsonObject as Map<String, dynamic>);
  }

  static Future<BankAccounts> getUserBankAccounts(int userId) async {
    var apiResult =
        await http.get(Uri.parse(UsersData().bankAccounts + userId.toString()));
    print(apiResult.body);
    dynamic jsonObject = json.decode(apiResult.body);
    return BankAccounts.fromJson(jsonObject as Map<String, dynamic>);
  }
}
