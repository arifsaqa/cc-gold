import 'package:get/instance_manager.dart';
import 'package:learnUI/controllers/transactionController.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
  }
}
