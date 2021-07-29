//
import 'package:get/instance_manager.dart';
import 'package:learnUI/controllers/dataTreesController.dart';

class DataTreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataTreeController());
  }
}
