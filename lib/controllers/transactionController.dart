import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/transaction/transactions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionController extends GetxController {
//   {
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

  Future<String> createTransation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ok = pref.getInt("userId");
    try {
      var asu = await DataFetching().createTransaction(ok!,
          nominal: getTotal.value,
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
        // asu.destinationNumber != null
        //     ? transactionsTF.value.data.add(asu)
        //     : transactions.value.data.add(asu);

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

  Future<String> getTransaction() async {
    loading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var ok = pref.getInt("userId");
    try {
      var asu = await DataFetching().getTransaction(ok!);
      if (asu != null) {
        for (var i = 0; i < asu.data.length; i++) {
          asu.data[i].destinationNumber != null &&
                  (!transactionsTF.value.data.contains(asu.data[i]) &&
                      !transactions.value.data.contains(asu.data[i]))
              ? transactionsTF.value.data.add(asu.data[i])
              : transactions.value.data.add(asu.data[i]);
        }
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
  }
}
