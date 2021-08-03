import 'package:get/state_manager.dart';
import 'package:learnUI/api/data.dart';
import 'package:learnUI/models/payment_methods/payment_method.dart';
import 'package:learnUI/models/payment_methods/payment_method_response.dart';

class PaymentMethodController extends GetxController {
  var loading = false.obs;
  var paymentMethodResponse = PaymentMethodResponse(
    status: 0,
    paymentMethods: [],
  ).obs;
  var paymentMethod = <PaymentMethod>[].obs;

  Future<void> toTrue() async {
    loading.value = true;
  }

  Future<void> toFalse() async {
    loading.value = false;
  }

  Future<void> getPaymentMethods() async {
    await toTrue();
    var res = await DataFetching().getPaymentMethods();
    if (res != null) {
      paymentMethodResponse.value = await (res);
      paymentMethod.value = await res.paymentMethods;
      print(res);
      await toFalse();
    } else {
      print("payment methoooood page load before the data render");
      await toFalse();
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPaymentMethods();
  }
}
