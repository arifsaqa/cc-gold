import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/api/auth.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/main.dart';
import 'package:learnUI/screens/welcome/resetPinScreen.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify extends GetxController {
  final userController = Get.put(UserController());
  var loading = false.obs;
  var resendToken = 0.obs;
  var timeOut = 30.obs;
  var rensendIncrement = 1.obs;

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<int> verify(bool isResetPassword, String phone, {int? resend}) async {
    await toTrue();
    int i = 0;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: timeOut.value * rensendIncrement.value),
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
            i = 0;
          }
          if (e.code == 'too-many-requests') {
            Get.snackbar("Verifikasi",
                "Anda melebihi batas permintaan verifikasi, coba lagi nanti",
                colorText: Colors.white);
            i = 0;
          }
          i = 0;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          Get.snackbar("Oke", "Waktu verifikasi habis",
              colorText: Colors.white);
          print(verificationId);
          i = 0;
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          Get.snackbar("Verifikasi", "Verifikasi Berhasil",
              colorText: Colors.green[400]);
          i = 1;
          !isResetPassword
              ? () async {
                  int res = await verifiedByOTP();
                  if (res == 1) {
                    Get.snackbar("Status", "Verifikasi berhasil",
                        colorText: Colors.green);
                    SharedPreferences getId =
                        await SharedPreferences.getInstance();
                    await userController.getUserById(getId.getInt("userId")!);
                    await Future.delayed(Duration(seconds: 3), () {
                      Get.to(LoggedIn());
                      return;
                    });
                  } else {
                    Get.snackbar("Status", "Verifikasi gagal",
                        colorText: Colors.red);
                  }
                }()
              : Get.to(ResetPinScreen(redirecto: '/login'));
        },
        codeSent: (String verificationId, resend) {
          Get.snackbar("Oke", "Kode Terkirim", colorText: Colors.white);
          resendToken.value = resend!;
          rensendIncrement.value += 1;
        },
      );
      return i;
    } catch (e) {
      print(e);
      Get.snackbar("Oke", e.toString(), colorText: Colors.white);
      return 0;
    } finally {
      await toFalse();
    }
  }

  Future<int> verifiedByOTP() async {
    LocalUser user = LocalUser();
    String? token = await user.getToken();
    try {
      int? res = await AuthFunctions.verifiedByOTP(token!);
      return res!;
    } catch (e) {
      // print(res);
      print(e);
      return 0;
    }
  }
}
