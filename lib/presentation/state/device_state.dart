import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/application/services/device_service.dart';

class DeviceState extends GetxController {
  final deviceService = DeviceService();
  RxList<Device> devices = <Device>[].obs;
  RxBool isLoading = true.obs;

  void getDevices() async {
    try {
      isLoading(true);
      final devicesData = await deviceService.getDevices();
      devices.assignAll(devicesData);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDevices();
  }

  void refreshDevices() {
    getDevices();
  }
}