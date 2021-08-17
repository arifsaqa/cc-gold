import 'dart:convert';

import 'package:get/get.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:learnUI/models/current_gold_price/current_price.dart';
import 'package:learnUI/models/gold_news/gold_news.dart';
import 'package:learnUI/models/gold_prices/prices.dart';
import 'package:learnUI/models/payment_methods/payment_method_response.dart';
import 'package:learnUI/models/promo/promos.dart';
import 'package:learnUI/models/transaction/transactions.dart';
import 'package:learnUI/models/transaction/transaction.dart';

class DataFetching {
  final url = Get.put(DataUrl());
  final url1 = Get.put(UsersData());

  Future<Promos?> getPromo() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.getPromo),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(apiResult.statusCode);
      print(apiResult.body);
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPromos = Promos.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPromos;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrro cok $e");
    }
  }

  Future<Prices?> getBuyPrice() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.getBuyPrice),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice = Prices.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrro cok $e");
    }
  }

  Future<Prices?> getSellPrice() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.getSellPrice),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice = Prices.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }

  Future<CurrentPrice?> getCurrentSellPrice() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.currentSellPrice),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            CurrentPrice.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }

  Future<CurrentPrice?> getCurrentBuyPrice() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.currentBuyPrice),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            CurrentPrice.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }

  Future<NewsRespon?> getGoldNews(String fromDate, String toDate) async {
    try {
      var apiResult = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=gold%26futures&sortBy=popularity&pageSize=5&apiKey=f0e15b7082ce461899934bfbe94c4e4a'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            NewsRespon.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }

  Future<PaymentMethodResponse?> getPaymentMethods() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.paymentMethods),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(apiResult.statusCode);
      print(apiResult.body);
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedPrice =
          PaymentMethodResponse.fromJson(jsonObject as Map<String, dynamic>);
      return parsedPrice;
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }

  Future<Transactions?> getTransaction(int id) async {
    try {
      var apiResult = await http.get(
        Uri.parse(url1.getOrCreateTransaction + id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedPrice =
          Transactions.fromJson(jsonObject as Map<String, dynamic>);
      return parsedPrice;
    } catch (e) {
      print("Error while get transaction data $e");
    }
  }

  Future<Transaction?> createTransaction(
    int id, {
    required int type,
    required int payment,
    required int gram,
    required int priceId,
    required int adminFee,
    required int nominal,
    required int discount,
    required String barcode,
    String? destinationNumber,
    String? message,
  }) async {
    try {
      var apiResult = await http.post(
          Uri.parse(url1.getOrCreateTransaction + id.toString()),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: jsonEncode({
            "userId": id,
            "type": type,
            "payment": payment,
            "gram": gram,
            "priceId": priceId,
            "adminFee": adminFee,
            "nominal": nominal,
            "discount": discount,
            "barcode": barcode,
            "destinationNumber": destinationNumber,
            "message": message,
          }));
      print(apiResult.statusCode);
      print(apiResult.body);
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedPrice =
          Transaction.fromJson(jsonObject as Map<String, dynamic>);
      return parsedPrice;
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }
}
