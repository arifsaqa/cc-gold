import 'package:get/state_manager.dart';

class TransactionController extends GetxController {
  var selectedIndex = 0.obs;
  var getTotal = 0.obs;
  var gram = 1.obs;
  void setSelectedPrice(int index, int price) {
    switch (index) {
      case 0:
        selectedIndex.value = index;
        getTotal.value = price;
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
}
