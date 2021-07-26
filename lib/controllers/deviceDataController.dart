import 'package:get/state_manager.dart';

class DeviceDataController extends GetxController {
  var deviceId = "".obs;

  Future<void> setDeviceId(String deviceIdGenerate) async {
    deviceId.value = deviceIdGenerate;
  }
}
