import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/application/services/device_service.dart';
import 'package:simodang_v2/application/services/pond_services.dart';

class AddPondController extends GetxController {
  Rx<TextEditingController> pondNameController = TextEditingController().obs;
  Rx<TextEditingController> pondAddressController = TextEditingController().obs;
  Rx<TextEditingController> pondCityController = TextEditingController().obs;
  RxBool isFilled = true.obs;
  RxnString deviceId = RxnString();

  var noDevice = false.obs;

  RxList<Device> devices = <Device>[].obs;

  void setIsFilled(bool isFilled) {
    this.isFilled.value = isFilled;
  }

  void setDeviceId(String? deviceId) {
    this.deviceId.value = deviceId;
  }

  void setNoDevice(bool noDevice) {
    this.noDevice.value = noDevice;
  }

  Future<void> createPond() async {
    if (pondNameController.value.text == "") {
      return;
    }

    if (pondAddressController.value.text == "") {
      return;
    }

    if (pondCityController.value.text == "") {
      return;
    }

    if (deviceId.value == "") {
      return;
    }

    if (noDevice.value) {
      setDeviceId(null);
    }

    Pond pond = Pond(
      id: "",
      seedCount: 0,
      seedDate: DateTime.now().toUtc().toIso8601String(),
      status: false,
      name: pondNameController.value.text,
      address: pondAddressController.value.text,
      city: pondCityController.value.text,
      isFilled: isFilled.value,
      deviceId: deviceId.value ?? "",
      imageUrl: '',
      createdAt: DateTime.now().toUtc().toIso8601String(),
      userId: "",
    );

    // print(pond.toJson());
    await PondService().createPond(pond);
  }

  Future<List<Device>> getDevices() async {
    List<Device> devices = await DeviceService().getDevices();
    return devices;
  }

  @override
  void onInit() {
    super.onInit();
    getDevices().then((value) {
      devices.value = value;
    });
  }
}