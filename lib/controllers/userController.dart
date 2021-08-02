import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:learnUI/api/auth.dart';
import 'package:get/get.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/cekToken.dart';
import 'package:learnUI/models/gold_news/article.dart';
import 'package:learnUI/models/gold_news/gold_news.dart';
import 'package:learnUI/models/saldo/saldo_response.dart';
import 'package:learnUI/models/user/user.dart';
import 'package:learnUI/models/user/user_response.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userResponse =
      UserResponse(status: 0, user: null, token: '', isDeviceMatch: false).obs;
  var user = User(
          name: '',
          isVerified: 0,
          phone: '',
          email: '',
          id: 0,
          image: '',
          role: 0,
          deviceId: '',
          createdAt: '',
          updatedAt: '')
      .obs;

  var tokenStatus = IsTokenValid().obs;
  var loading = false.obs;
  var now = DateTime.now().obs;

  List<String> hari = [
    "",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jum'at",
    "Sabtu",
    "Minggu",
  ];
  String get today => DateFormat('dd MMMM yyyy').format(now.value);
  String get todayForApi => DateFormat('dd-mm-yyyy').format(now.value);
  String get yesterdayForApi =>
      DateFormat('dd-mm-yyyy').format(now.value.subtract(Duration(days: 20)));
  String get day => (hari[now.value.weekday]);
  String greeting() {
    var hour = now.value.hour.obs;
    if (hour < 12) {
      return 'Selamat Pagi,';
    }
    if (hour < 15) {
      return 'Selamat Siang';
    }
    if (hour < 17) {
      return 'Selamat Sore,';
    }
    return 'Selamat Malam,';
  }

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  LocalUser localUser = LocalUser();
  Future<String> login(String password) async {
    toTrue();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ok = await pref.getString("phone");
    try {
      var asu = await AuthFunctions.login(ok!, password);
      if (asu != null) {
        userResponse.value = await asu;
        user.value = (await asu.user)!;
        await localUser.setLocalUser(
            phoneNumber: ok,
            userId: userResponse.value.user!.id,
            token: userResponse.value.token);
        await toFalse();
        return "oke";
      } else {
        toFalse();
        Get.snackbar<void>("Login Error", "Invalid phone number or password",
            snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
        return "hmm";
      }
    } catch (e) {
      print('while getting data  ' + e.toString());
      toFalse();
      Get.snackbar<void>("Login Error",
          "Somthing wrong with our app, try again or contact our IT Support",
          snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
      return "cok";
    }
  }

  Future<bool> snack(IsTokenValid? i) async {
    await i;
    return i?.status == 1;
  }

  Future<int> istokenValid(String token) async {
    try {
      await toTrue();
      var oke = await AuthFunctions.checkToken(token);
      if (oke!.status != 0) {
        tokenStatus.value = await oke;
        Get.snackbar<void>("Your session status", "You are good, logging in!",
            snackPosition: SnackPosition.TOP, colorText: Colors.green[600]);
        await toFalse();
        return 1;
      } else {
        tokenStatus.value = await oke;
        await toFalse();
        Get.snackbar<void>("Your session is expired", "Get you to relogin page",
            snackPosition: SnackPosition.TOP, colorText: Colors.red[600]);
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<int> getUserById(int id) async {
    try {
      var cok = await AuthFunctions.getUserById(id);
      // userResponse.value.user = await cok;
      user.value = await cok;
      return 1;
    } catch (e) {
      print('while getting user data  ' + e.toString());
      Get.snackbar<void>(
          "App's Error", "Somthing wrong!, Get to our IT support",
          snackPosition: SnackPosition.TOP, colorText: Colors.red[600]);
      return 0;
    }
  }

  var saldo = SaldoResponse(status: 0, saldo: null).obs;
  var isSaldoVisible = true.obs;

  void toogleHideSaldo() {
    isSaldoVisible.value = !isSaldoVisible.value;
  }

  Future<void> getUserSaldo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = await pref.getInt("userId");
    print('User AAAAAidiiiiiiiiii' + userId.toString());
    await toTrue();
    var res = await AuthFunctions.getUserSaldo(userId!);
    saldo.value = await (res);
    await toFalse();
  }

  var newsResponse =
      NewsRespon(articles: [], status: "Not fetching yet", totalResults: 0).obs;
  var goldNews = <Article>[].obs;

  Future<void> getGoldNews() async {
    await toTrue();
    var res = await DataFetching().getGoldNews(yesterdayForApi, todayForApi);
    if (res != null) {
      newsResponse.value = await (res);
      goldNews.value = await res.articles;
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    now.value = DateTime.now();
    getGoldNews();
    Timer.periodic(Duration(hours: 3), (timer) {
      now.value = DateTime.now();
    });
  }
}
