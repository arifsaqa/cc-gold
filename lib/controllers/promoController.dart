import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/promo/promo.dart';
import 'package:learnUI/models/promo/promos.dart';

class PromoController extends GetxController {
  var promos = Promos(status: 0, promos: []).obs;
  var loading = false.obs;
  RxList<Promo> promo = <Promo>[].obs;

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  Future<void> getPromoFunction() async {
    await toTrue();
    try {
      var res = await DataFetching().getPromo();
      print(res);
      if (res != null) {
        promos.value = (res);
        promo = res.promos.obs;
        await toFalse();
      } else {
        print("page load before the data render");
        await toFalse();
        return null;
      }
    } catch (e) {
      // TODO
      print(e);
    }
  }
}
