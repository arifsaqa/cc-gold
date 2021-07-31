import 'dart:convert';

import 'package:get/get.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:learnUI/models/current_gold_price/current_price.dart';
import 'package:learnUI/models/gold_news/gold_news.dart';
import 'package:learnUI/models/gold_prices/prices.dart';
import 'package:learnUI/models/payment_methods/payment_method_response.dart';
import 'package:learnUI/models/promo/promos.dart';

class DataFetching {
  final url = Get.put(DataUrl());

  Future<Promos?> getPromo() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.getPromo),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 201) {
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

  Future<NewsRespon?> getGoldNews(String fromDate, String toDate) async {
    try {
      var apiResult = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?qInTitle=gold%26investments&from=${fromDate}9&to=${toDate}&sortBy=popularity&pageSize=5&apiKey=f0e15b7082ce461899934bfbe94c4e4a'),
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
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            PaymentMethodResponse.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }
}
