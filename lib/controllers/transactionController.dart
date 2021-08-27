import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/models/standart_response.dart';
import 'package:learnUI/models/transaction/transactions.dart';
import 'package:learnUI/models/transaction/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionController extends GetxController {
//   {
  var promoId = 0.obs;
  var selectedNumber = ''.obs;
  var transactions = Transactions(status: 0, data: []).obs;
  var transactionsTF = Transactions(status: 0, data: []).obs;
  var destinationNumber = ''.obs;
  var message = ''.obs;
  var loading = false.obs;
  //type 1 2 3
  var transactionType = 0.obs;
//   "type": "The type field is required.",
  var payment = 1.obs;
  var gram = 1.obs; //gram
//   "gram": "The gram field is required.",
  var priceId = 0.obs;
//   "priceId": "The price id field is required.",
  var adminfee = 0.obs;
//   "adminFee": "The admin fee field is required.",
  var getTotal = 0.obs; //nominal for post
//   "nominal": "The nominal field is required.",
  var discount = 0.obs;
//   "discount": "The discount field is required.",
  var barcode = ''.obs;
//   "barcode": "The barcode field is required."
// }
  var selectedIndex = 0.obs; //just for view

  Future<void> setBarcode(String brc) async {
    barcode.value = brc;
    barcode.refresh();
  }

  void onclickTry() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 3));
    loading.value = false;
  }

  void setSelectedPrice(int index, int price) {
    switch (index) {
      case 0:
        selectedIndex.value = index;
        getTotal.value = price;
        gram.value = 1;
        break;
      case 1:
        gram.value = 2;
        selectedIndex.value = index;
        getTotal.value = price * 2;
        break;
      case 2:
        gram.value = 5;
        selectedIndex.value = index;
        getTotal.value = price * 5;
        break;
      case 3:
        gram.value = 10;
        selectedIndex.value = index;
        getTotal.value = price * 10;
        break;
      case 4:
        gram.value = 50;
        selectedIndex.value = index;
        getTotal.value = price * 50;
        break;
      case 5:
        gram.value = 100;
        selectedIndex.value = index;
        getTotal.value = price * 100;
        break;
      default:
    }
  }

  Future<String> postReferral(String refferal) async {
    try {
      var oke = await DataFetching().postReferral(refferal);
      if (oke.status != 1) {
        return "Gagal menggunakan kode referral, pastikan kode anda benar dan belum digunakan";
      } else {
        return "Kode referral berhasil digunakan";
      }
    } on Exception catch (e) {
      print(e);
      return "Gagal menggunakan kode referral";
    }
  }

  Future<String> usePromo(int id) async {
    try {
      var oke = await DataFetching().postPromo(id);
      if (oke.status != 1) {
        return "Anda sudah menggunakan promo ini";
      } else {
        return "Promo berhasil digunakan";
      }
    } on Exception catch (e) {
      print(e);
      return "Gagal menggunakan promo";
    }
  }

  Future<String> createTransation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ok = pref.getInt("userId");
    try {
      if (discount.value != 0) {
        var promoRes = await usePromo(promoId.value);
        print("cooook" + promoRes);
        if (promoRes != "Promo berhasil digunakan") {
          Get.defaultDialog(
            title: "Promo",
            titlePadding: EdgeInsets.only(top: 20),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            middleText: "Anda sudah menggunakan promo ini",
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.red[400]),
            middleTextStyle: TextStyle(color: Colors.red[400]),
            confirm: TextButton(
                onPressed: () async {
                  resetVariables();
                  Get.offAllNamed('/logged');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(background),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    "Pilih promo lain",
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Color(lowerGradient)),
                  ),
                )),
          );
          // Get.snackbar("Promo", promoRes,
          //     colorText: promoRes == 'Promo berhasil digunakan'
          //         ? Colors.green[400]
          //         : Colors.red[400]);
          return "Promo wes digae";
        }
      }
      var asu = await DataFetching().createTransaction(ok!,
          nominal: getTotal.value - discount.value,
          type: transactionType.value,
          adminFee: adminfee.value,
          priceId: priceId.value,
          barcode: barcode.value,
          discount: discount.value,
          gram: gram.value,
          payment: payment.value,
          destinationNumber: destinationNumber.value,
          message: message.value);
      if (asu != null) {
        loading.value = false;
        Get.snackbar<void>("Transation success!",
            "We're working asap to validate your transaction",
            snackPosition: SnackPosition.TOP, colorText: Colors.green[600]);
        return "oke";
      } else {
        loading.value = false;
        // Get.snackbar<void>("Transation ", "Invalid phone number or password",
        // snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
        return "hmm";
      }
    } catch (e) {
      print('while creating transaction  ' + e.toString());
      loading.value = false;
      Get.snackbar<void>("Login Error",
          "Somthing wrong with our app, try again or contact our IT Support",
          snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
      return "cok";
    }
  }

  List<Transaction> get tfTransactions => transactions.value.data
      .where((element) => element.destinationNumber != null)
      .toList();
  List<Transaction>? get sellPriceTransaction => transactions.value.data
      .where((element) => element.destinationNumber == null)
      .toList();

  Future<String> getTransaction() async {
    loading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ok = pref.getInt("userId");
    try {
      var asu = await DataFetching().getTransaction(ok!);
      if (asu != null) {
        transactions.value = asu;
        loading.value = false;
        return "oke";
      } else {
        loading.value = false;
        return "hmm";
      }
    } catch (e) {
      print('while creating transaction  ' + e.toString());
      loading.value = false;
      Get.snackbar<void>("Login Error",
          "Somthing wrong with our app, try again or contact our IT Support",
          snackPosition: SnackPosition.TOP, colorText: Colors.yellow[600]);
      return "cok";
    }
  }

  String getDay(date) => DateFormat('dd MMMM yyyy').format(date);

  void resetTransactionStates() {
    transactions.value = Transactions(status: 0, data: []);
    transactionsTF.value = Transactions(status: 0, data: []);
  }

  void resetVariables() {
    getTotal.value = 0;
    transactionType.value = 0;
    adminfee.value = 0;
    priceId.value = 0;
    barcode.value = '';
    discount.value = 0;
    gram.value = 0;
    payment.value = 0;
    destinationNumber.value = '';
    message.value = '';
    promoId.value = 0;
  }
}
