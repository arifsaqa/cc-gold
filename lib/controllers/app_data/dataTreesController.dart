import 'package:get/state_manager.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/current_gold_price/current_price.dart';
import 'package:learnUI/models/current_gold_price/current_price_data.dart';
import 'package:learnUI/models/gold_prices/price.dart';
import 'package:learnUI/models/gold_prices/prices.dart';
import 'package:learnUI/models/phoneNumbers/phone_numbers.dart';

class DataTreeController extends GetxController {
  var loading = false.obs;
  var sellPrices =
      Prices(status: 0, message: 'not fetching yet', price: []).obs;
  RxList<Price> sellPrice = <Price>[].obs;

  var buyPrices = Prices(status: 0, message: 'not fetching yet', price: []).obs;
  RxList<Price> buyPrice = <Price>[].obs;
  var currentSellPrice = CurrentPrice(
          status: 0,
          message: "not fetching yet",
          price:
              CurrentPriceData(createdAt: '', id: 0, price: 0, updatedAt: ''))
      .obs;

  var currentBuyPrice = CurrentPrice(
          status: 0,
          message: "not fetching yet",
          price:
              CurrentPriceData(createdAt: '', id: 0, price: 0, updatedAt: ''))
      .obs;

  var buyPriceL =
      CurrentPriceData(createdAt: '', id: 0, price: 0, updatedAt: '').obs;
  var sellPriceL =
      CurrentPriceData(createdAt: '', id: 0, price: 0, updatedAt: '').obs;
  var phoneNumbers = <String>[].obs;
  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  Future<void> getSellPrice() async {
    await toTrue();
    var res = await DataFetching().getSellPrice();
    if (res != null) {
      sellPrices.value = (res);
      sellPrice = res.price.obs;
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }

  Future<int> getSellPriceById(int id) async {
    await toTrue();
    var res = await DataFetching().getSellPriceById(id);
    if (res != null) {
      await toFalse();
      return res.price;
    } else {
      print("page load before the data render");
      await toFalse();
      return 0;
    }
  }

  Future<void> getBuyPrice() async {
    await toTrue();
    var res = await DataFetching().getBuyPrice();
    if (res != null) {
      buyPrices.value = (res);
      buyPrice = res.price.obs;
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }

  Future<void> getCurrentSellPrice() async {
    await toTrue();
    var res = await DataFetching().getCurrentSellPrice();
    if (res != null) {
      print("sSellPRICEEEEEEEEEEEEEE" + res.price.price.toString());
      currentSellPrice.value = res;
      sellPriceL.value = res.price;
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }

  Future<void> getCurrentBuyPrice() async {
    await toTrue();
    var res = await DataFetching().getCurrentBuyPrice();
    if (res != null) {
      currentBuyPrice.value = (res);
      buyPriceL.value = res.price;
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }

  Future<int> getBuyPriceById(int id) async {
    await toTrue();
    var res = await DataFetching().getBuyPriceById(id);
    if (res != null) {
      await toFalse();
      return res.price;
    } else {
      print("page load before the data render");
      await toFalse();
      return 0;
    }
  }

  Future<int> getUserNumbers() async {
    await toTrue();
    var res = await DataFetching().getuserNumbers();
    if (res != null) {
      await toFalse();
      phoneNumbers.value = res.phoneNumbers;
      return 1;
    } else {
      print("page load before the data render");
      await toFalse();
      return 0;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getBuyPrice();
    getSellPrice();
    getCurrentSellPrice();
    getCurrentBuyPrice();
  }
}
