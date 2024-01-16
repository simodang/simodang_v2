import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  var startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.fromMicrosecondsSinceEpoch(0).obs;

  void changeStartDate(DateTime date) {
    startDate.value = date;
  }

  void changeEndDate(DateTime date) {
    endDate.value = date;
  }

  String getStartDateString() {
    return formatDate(startDate.value, [dd, ' ', MM, ' ', yyyy]);
  }

  String getEndDateString() {
    if (endDate.value == DateTime.fromMicrosecondsSinceEpoch(0)) {
      return "-";
    }
    return formatDate(endDate.value, [dd, ' ', MM, ' ', yyyy]);
  }

  void submit() {
    if (endDate.value == DateTime.fromMicrosecondsSinceEpoch(0)) {
      Get.snackbar(
        "Error",
        "Tanggal akhir tidak boleh kosong", 
        backgroundColor: Colors.red,
        colorText: Colors.white
      );
      return;
    }

    if (startDate.value.isAtSameMomentAs(endDate.value)) {
      Get.snackbar(
        "Error",
        "Tanggal awal dan akhir tidak boleh sama",
        backgroundColor: Colors.red,
        colorText: Colors.white
      );
      return;
    }

    Get.back(result: {
      'startDate': startDate.value,
      'endDate': endDate.value,
    });
  }
}