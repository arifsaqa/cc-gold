import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:learnUI/api/auth.dart';
import 'package:get/get.dart';
import 'package:learnUI/models/User.dart';
import 'package:learnUI/models/cekToken.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userData = UserData().obs;
  var tokenStatus = IsTokenValid().obs;
  var loading = false.obs;

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  LocalUser localUser = LocalUser();
  Future<String?> login(String password) async {
    toTrue();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ok = await pref.getString("phone");
    try {
      var asu = await AuthFunctions.login(ok!, password);
      if (asu != null) {
        userData.value = await asu;
        await localUser.setLocalUser(
            phoneNumber: ok,
            userId: userData.value.user!.id as int,
            token: userData.value.token as String);
        // pref.setString("token", userData.value.token as String);
        await toFalse();
        return "oke";
      } else {
        toFalse();
        userData.value.user = null;
        Get.snackbar<void>("Login Error", "Invalid phone number or password",
            snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
      }
    } catch (e) {
      print(e);
      toFalse();
      userData.value.user = null;
      Get.snackbar<void>("Login Error",
          "Somthing wrong with our app, try again or contact our IT Support",
          snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
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
      print(e);
      return 0;
    }
  }

  Future<int> getUserById(int id) async {
    try {
      var user = await AuthFunctions.getUserById(id);
      if (user != null) {
        userData.value.user = user;
        // Get.snackbar<void>("Your session status", "You are good, logging in!",
        //     snackPosition: SnackPosition.TOP, colorText: Colors.green[600]);
        print(user);
        return 1;
      } else {
        // Get.snackbar<void>("Your session is expired", "Get you to relogin page",
        //     snackPosition: SnackPosition.TOP, colorText: Colors.red[600]);
        print(user);
        return 0;
      }
    } catch (e) {
      print(e);
      Get.snackbar<void>(
          "App's Error", "Somthing wrong!, Get to our IT support",
          snackPosition: SnackPosition.TOP, colorText: Colors.red[600]);

      return 0;
    }
  }
}
