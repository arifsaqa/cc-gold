import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/promo/promo.dart';
import 'package:learnUI/models/promo/promos.dart';

class PromoController extends GetxController {
  var promos = Promos(status: 0, message: "not fetching yet", promos: []).obs;
  var loading = false.obs;
  RxList<Promo> promo = <Promo>[].obs;

  // @override
  // void onInit() {
  //   getPromoFunction();
  //   super.onInit();
  // }

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  Future<void> getPromoFunction() async {
    await toTrue();
    var res = await DataFetching().getPromo();
    if (res != null) {
      promos.value = await (res);
      promo = await res.promos.obs;
      print("data hereeeeeeeeeeeeeee");
      print(res);
      await toFalse();
    } else {
      print("page load before the data render");
      await toFalse();
      return null;
    }
  }
}
