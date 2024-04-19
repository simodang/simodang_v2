import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/select_device/select_device_controller.dart';

class SelectDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SelectDeviceController>(SelectDeviceController());
  }
}