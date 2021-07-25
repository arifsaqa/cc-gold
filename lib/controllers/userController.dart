import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:learnUI/api/auth.dart';
import 'package:get/get.dart';
import 'package:learnUI/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var user = UserData().obs;
  var loading = false.obs;
  Future<String?> login(String password) async {
    toTrue();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ok = await pref.getString("phone");
    try {
      var asu = await AuthFunctions.login(ok!, password);
      if (asu != null) {
        user.value = await asu;
        await pref.setString("deviceId", user.value.user!.deviceId.toString());
        await pref.setInt("userId", user.value.user!.id as int);
        await toFalse();
        return "oke";
      } else {
        toFalse();
        user.value.user = null;
        Get.snackbar<void>("Login Error", "Invalid phone number or password",
            snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
      }
    } catch (e) {
      print(e);
      toFalse();
      user.value.user = null;
      Get.snackbar<void>("Login Error",
          "Somthing wrong with our app, try again or contact our IT Support",
          snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
    }
  }

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }
}
