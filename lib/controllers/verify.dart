import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verify extends GetxController {
  var loading = false.obs;

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> verify(String phone) async {
    await toTrue();
    try {
      // print(phone);
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
          if (e.code == 'too-many-requests') {
            Get.snackbar("Verifikasi",
                "Anda melebihi batas permintaan verifikasi, coba lagi nanti",
                colorText: Colors.white);
          }
          // print(e.code);
          // Get.snackbar("Oke", "Verifikasi Gagal", colorText: Colors.white);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          Get.snackbar("Oke", "codeAutoRetrievalTimeout",
              colorText: Colors.white);
          print(verificationId);
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          Get.snackbar("Verifikasi", "Verifikasi Berhasil",
              colorText: Colors.white);
          print(phoneAuthCredential.smsCode);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Get.snackbar("Oke", "Kode Terkirim", colorText: Colors.white);
          print(verificationId);
        },
      );
    } catch (e) {
      print(e);
      Get.snackbar("Oke", e.toString(), colorText: Colors.white);
    } finally {
      await toFalse();
    }
  }
}
