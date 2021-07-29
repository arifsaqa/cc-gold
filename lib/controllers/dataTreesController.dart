import 'package:get/state_manager.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/gold_prices/price.dart';
import 'package:learnUI/models/gold_prices/prices.dart';

class DataTreeController extends GetxController {
  var loading = false.obs;
  var sellPrices =
      Prices(status: 0, message: 'not fetching yet', price: []).obs;
  RxList<Price> sellPrice = <Price>[].obs;

  var buyPrices = Prices(status: 0, message: 'not fetching yet', price: []).obs;
  RxList<Price> buyPrice = <Price>[].obs;

  var selectedIndex = 0.obs;
  var selectedPrice = 0.obs;
  void setSelectedPrice(int index, int price) {
    selectedIndex.value = index;
    selectedPrice.value = price;
  }

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  Future<void> getSellPrice() async {
    await toTrue();
    var res = await DataFetching.getSellPrice();
    if (res != null) {
      sellPrices.value = await (res);
      sellPrice = await res.price.obs;
      print("data hereeeeeeeeeeeeeee");
      print(res);
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }

  Future<void> getBuyPrice() async {
    await toTrue();
    var res = await DataFetching.getBuyPrice();
    if (res != null) {
      buyPrices.value = await (res);
      buyPrice = await res.price.obs;
      print("data hereeeeeeeeeeeeeee");
      print(res);
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
  }
}
