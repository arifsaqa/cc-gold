import 'package:get/instance_manager.dart';
import 'package:learnUI/controllers/app_data/payment_method_controller.dart';

class PaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentMethodController());
  }
}
