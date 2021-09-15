import 'dart:convert';

import 'package:get/get.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:learnUI/models/current_gold_price/current_price.dart';
import 'package:learnUI/models/current_gold_price/current_price_data.dart';
import 'package:learnUI/models/faq/faq_response.dart';
import 'package:learnUI/models/gold_news/gold_news.dart';
import 'package:learnUI/models/gold_prices/prices.dart';
import 'package:learnUI/models/payment_methods/payment_method_response.dart';
import 'package:learnUI/models/phoneNumbers/phone_numbers.dart';
import 'package:learnUI/models/policy/policy_response.dart';
import 'package:learnUI/models/promo/promos.dart';
import 'package:learnUI/models/standart_response.dart';
import 'package:learnUI/models/transaction/transactionResponse.dart';
import 'package:learnUI/models/transaction/transactions.dart';
import 'package:learnUI/models/transaction/transaction.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataFetching {
  final url = Get.put(DataUrl());
  final url1 = Get.put(UsersData());
  final localData = LocalUser();

  Future<Promos?> getPromo() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.getPromo),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(apiResult.body);
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPromos = Promos.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPromos;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrro cok $e get promo");
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
      print("Errrrrrrrrro cok $e get butprice");
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
      print(e);
      print("Errrrrrrrrror cooook $e sellprice");
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
      print("Errrrrrrrrror cooook $e current sell price");
    }
  }

  Future<CurrentPriceData?> getSellPriceById(int id) async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.sellPriceById + id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            CurrentPriceData.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e  get sellpricxe");
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
      print("Errrrrrrrrror cooook $e getCurrne by price");
    }
  }

  Future<CurrentPriceData?> getBuyPriceById(int id) async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.buyPriceById + id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            CurrentPriceData.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e getBuyPrice");
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
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedPrice =
          PaymentMethodResponse.fromJson(jsonObject as Map<String, dynamic>);
      return parsedPrice;
    } catch (e) {
      print("Errrrrrrrrror cooook $e get payment method");
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
      print("Error while get transaction data $e get transaction");
    }
  }

  Future<TransactionResponse?> createTransaction(
    int id, {
    required int type,
    required int payment,
    required double gram,
    required int priceId,
    required int adminFee,
    required int nominal,
    required int discount,
    required String barcode,
    required String destinationNumber,
    required String message,
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
            "destinationNumber":
                destinationNumber.length > 0 ? destinationNumber : "",
            "message": message.length > -0 ? message : "",
          }));
      print(apiResult.body);
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedPrice =
          TransactionResponse.fromJson(jsonObject as Map<String, dynamic>);
      return parsedPrice;
    } catch (e) {
      print("Errrrrrrrrror cooook while create transaction $e");
    }
  }

  Future<StandartResponse> postReferral(String refferal) async {
    try {
      SharedPreferences id = await SharedPreferences.getInstance();
      int? userId = id.getInt("userId");
      var apiResult = await http.post(Uri.parse(url1.refferal),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: jsonEncode({
            "userId": userId,
            "refferal": refferal,
          }));
      print(apiResult.body);
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedPrice =
          StandartResponse.fromJson(jsonObject as Map<String, dynamic>);
      return parsedPrice;
    } catch (e) {
      print(e);
      return StandartResponse(status: 0);
    }
  }

  Future<StandartResponse> postPromo(int promoId) async {
    try {
      SharedPreferences id = await SharedPreferences.getInstance();
      int? userId = id.getInt("userId");
      var apiResult = await http.post(
          Uri.parse(url1.postPromo + promoId.toString()),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: jsonEncode({
            "userId": userId,
          }));
      print(apiResult.body);
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedResponse =
          StandartResponse.fromJson(jsonObject as Map<String, dynamic>);
      return parsedResponse;
    } catch (e) {
      print(e);
      return StandartResponse(status: 0);
    }
  }

  Future<StandartResponse> usePoint(int point) async {
    try {
      SharedPreferences id = await SharedPreferences.getInstance();
      int? userId = id.getInt("userId");
      var apiResult = await http.post(Uri.parse(url1.usePoints),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: jsonEncode({"userId": userId, "point": point}));
      print(apiResult.body);
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedResponse =
          StandartResponse.fromJson(jsonObject as Map<String, dynamic>);
      return parsedResponse;
    } catch (e) {
      print(e);
      return StandartResponse(status: 0);
    }
  }

  Future<PhoneNumberResponse?> getuserNumbers() async {
    String? token = await localData.getToken();
    try {
      var apiResult = await http.get(
        Uri.parse(url.phoneNumbers),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      dynamic jsonObject = await json.decode(apiResult.body);
      var parsedPrice =
          PhoneNumberResponse.fromJson(jsonObject as Map<String, dynamic>);
      return parsedPrice;
    } catch (e) {
      print("Error while get transaction data $e get phoneNumbers");
    }
  }

  Future<PolicyResponse?> getPolicies() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.policy),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            PolicyResponse.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e policy");
    }
  }

  Future<FaqResponse?> getFaq() async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.faqs),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(apiResult.body);
      if (apiResult.statusCode == 200) {
        dynamic jsonObject = await json.decode(apiResult.body);
        var parsedPrice =
            FaqResponse.fromJson(jsonObject as Map<String, dynamic>);
        return parsedPrice;
      } else {
        return null;
      }
    } catch (e) {
      print("Errrrrrrrrror cooook $e faq");
    }
  }

  Future<Prices?> getBuyPriceGraph(String timeline) async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.buyPriceGraph + timeline),
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
      print("Errrrrrrrrror cooook $e  get sellpricxe");
    }
  }

  Future<Prices?> getSellPriceGraph(String timeline) async {
    try {
      var apiResult = await http.get(
        Uri.parse(url.sellPriceGraph + timeline),
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
      print("Errrrrrrrrror cooook $e  get sellpricxe");
    }
  }
}
