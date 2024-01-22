import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/application/services/device_service.dart';

class EditDeviceController extends GetxController {
  final String deviceId = Get.arguments['deviceId'];

  var isMaintenance = false.obs;
  var isFeedAuto = false.obs;
  var isWaterAuto = false.obs;

  RxDouble tempLow = 0.0.obs;
  RxDouble tempHigh = 100.0.obs;

  RxDouble phLow = 0.0.obs;
  RxDouble phHigh = 100.0.obs;

  RxDouble tdsLow = 0.0.obs;
  RxDouble tdsHigh = 100.0.obs;

  RxDouble tdoLow = 0.0.obs;
  RxDouble tdoHigh = 100.0.obs;

  RxDouble turbiditiesLow= 0.0.obs;
  RxDouble turbiditiesHigh = 100.0.obs;

  setMaintenance(bool value) => isMaintenance.value = value;
  setFeedAuto(bool value) => isFeedAuto.value = value;
  setWaterAuto(bool value) => isWaterAuto.value = value;

  setTempLow(double value) => tempLow.value = value;
  setTempHigh(double value) => tempHigh.value = value;

  setPhLow(double value) => phLow.value = value;
  setPhHigh(double value) => phHigh.value = value;

  setTdsLow(double value) => tdsLow.value = value;
  setTdsHigh(double value) => tdsHigh.value = value;

  setTdoLow(double value) => tdoLow.value = value;
  setTdoHigh(double value) => tdoHigh.value = value;

  setTurbiditiesLow(double value) => turbiditiesLow.value = value;
  setTurbiditiesHigh(double value) => turbiditiesHigh.value = value;

  Future<Device> getDevice(String deviceId) async {
    Device device = await DeviceService().getDevice(deviceId);
    setMaintenance(device.isSaved);
    setFeedAuto(device.autoFeedEnabled);
    setWaterAuto(device.autoWaterEnabled);
    setTempLow(device.tempLow);
    setTempHigh(device.tempHigh);
    setPhLow(device.phLow);
    setPhHigh(device.phHigh);
    setTdsLow(device.tdsLow);
    setTdsHigh(device.tdsHigh);
    setTdoLow(device.tdoLow);
    setTdoHigh(device.tdoHigh);
    setTurbiditiesLow(device.turbiditiesLow);
    setTurbiditiesHigh(device.turbiditiesHigh);

    return device;
  }

  Future<void> updateDevice(String pondId) async {
    Device device = Device(
      id: "",
      name: "",
      isSaved: isMaintenance.value,
      autoFeedEnabled: isFeedAuto.value,
      autoWaterEnabled: isWaterAuto.value,
      tempLow: tempLow.value,
      tempHigh: tempHigh.value,
      phLow: phLow.value,
      phHigh: phHigh.value,
      tdsLow: tdsLow.value,
      tdsHigh: tdsHigh.value,
      tdoLow: tdoLow.value,
      tdoHigh: tdoHigh.value,
      turbiditiesLow: turbiditiesLow.value,
      turbiditiesHigh: turbiditiesHigh.value,
    );
    print(pondId);

    await DeviceService().updateDeviceByPond(pondId, device);
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    getDevice(deviceId);
  }
}