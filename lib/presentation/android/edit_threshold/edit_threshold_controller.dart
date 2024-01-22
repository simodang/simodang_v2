import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditThresholdController extends GetxController {
  final String parameter = Get.arguments['param'];
  final String lowValue = Get.arguments['low'].toString();
  final String highValue = Get.arguments['high'].toString();
  final String max = Get.arguments['max'].toString();

  RxString parameterState = "".obs;
  RxDouble lowValueState = 0.0.obs;
  RxDouble highValueState = 0.0.obs;
  RxDouble maxState = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    parameterState.value = parameter;
    lowValueState.value = double.parse(lowValue);
    highValueState.value = double.parse(highValue);
    maxState.value = double.parse(max);
  }

  void setLowValue(double value) => lowValueState.value = value;
  void setHighValue(double value) => highValueState.value = value;

  void save() {
    if (lowValueState.value > highValueState.value) {
      Get.snackbar(
        "Error",
        "Batas bawah tidak boleh lebih besar dari batas atas",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.back(result: {
      'low': lowValueState.value,
      'high': highValueState.value,
    });
  }
}