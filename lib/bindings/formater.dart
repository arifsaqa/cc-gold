import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class DotFormatter extends Bindings {
  @override
  void dependencies() {
    Get.put(Formatter());
  }
}

class Formatter {
  final formatter = NumberFormat("###,###,###,###,###");
  String addDot(dynamic any) {
    return formatter.format(any);
  }
}
