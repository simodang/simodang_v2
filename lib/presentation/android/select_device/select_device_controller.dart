import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/application/services/device_service.dart';
import 'package:simodang_v2/presentation/state/device_state.dart';

class SelectDeviceController extends GetxController {
  final String deviceId = Get.arguments['deviceId'];

  RxString deviceIdState = "".obs;
  RxList<Device> devices = <Device>[].obs;

  void setDeviceId(String deviceId) {
    deviceIdState.value = deviceId;
  }

  Future<List<Device>> getDevices() async {
    final devices = await DeviceService().getDevices();
    return devices;
  }

  @override
  void onInit() async {
    super.onInit();
    deviceIdState.value = deviceId;
    await getDevices().then((value) => devices.assignAll(value));
  }
}