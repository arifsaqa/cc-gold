import 'package:get/instance_manager.dart';
import 'package:learnUI/controllers/userController.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
