import 'package:get/state_manager.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/current_gold_price/current_price.dart';
import 'package:learnUI/models/current_gold_price/current_price_data.dart';
import 'package:learnUI/models/gold_prices/price.dart';
import 'package:learnUI/models/gold_prices/prices.dart';

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
      sellPrices.value = await (res);
      sellPrice = await res.price.obs;
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }

  Future<void> getBuyPrice() async {
    await toTrue();
    var res = await DataFetching().getBuyPrice();
    if (res != null) {
      buyPrices.value = await (res);
      buyPrice = await res.price.obs;
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
      currentSellPrice.value = await res;
      sellPriceL.value.price = await res.price.price;
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
      print("BUYPRICEEEEEEEEEEEEEE" + res.price.price.toString());
      currentBuyPrice.value = await (res);
      buyPriceL.value.price = await res.price.price;
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
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
