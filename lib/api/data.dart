import 'dart:convert';

import 'package:learnUI/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:learnUI/models/gold_prices/prices.dart';
import 'package:learnUI/models/promo/promos.dart';

class DataFetching {
  static Future<Promos?> getPromo() async {
    try {
      var apiResult = await http.get(
        Uri.parse(DataUrl().getPromo),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(apiResult.statusCode);
      print(apiResult.body);
      if (apiResult.statusCode == 201) {
        dynamic jsonObject = await json.decode(apiResult.body);
        print(apiResult);
        var parsedPromos = Promos.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPromos;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrro cok $e");
    }
  }

  static Future<Prices?> getBuyPrice() async {
    try {
      var apiResult = await http.get(
        Uri.parse(DataUrl().getBuyPrice),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(apiResult.statusCode);
      print(apiResult.body);
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        print(apiResult);
        var parsedPrice = Prices.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrro cok $e");
    }
  }

  static Future<Prices?> getSellPrice() async {
    try {
      var apiResult = await http.get(
        Uri.parse(DataUrl().getSellPrice),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(apiResult.statusCode);
      print(apiResult.body);
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        print(apiResult);
        var parsedPrice = Prices.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e");
    }
  }
}
