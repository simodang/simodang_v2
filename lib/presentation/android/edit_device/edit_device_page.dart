import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/edit_device/edit_device.controller.dart';
import 'package:simodang_v2/presentation/android/edit_device/widgets/threshold_spinbox_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/list_text_widget.dart';

class EditDevicePage extends GetView<EditDeviceController> {

  onPressed(int min, int max, Function setFinal) {
    if (controller.isMinLessThanMax(min, max)) {
      setFinal();
      Get.key.currentState?.pop();
      return;
    }
    Get.snackbar(
        "Error",
        "Batas bawah tidak boleh lebih besar dari batas atas",
        backgroundColor: Colors.red,
        colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(EditDeviceController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Perangkat"),
      ),
      body: ListView(
        children: [
          ListTextWidget(text: "Mode Perangkat"),
          Obx(() => SwitchListTile(
            title: const Text("Mode Maintenance"),
            subtitle: const Text("Data yang dikirim dari perangkat tidak akan tampil pada grafik"),
            value: controller.isMaintenance.value,
            onChanged: (value) => controller.setMaintenance(value),
          )),
          ListTextWidget(text: "Otomasi"),
          Obx(() => SwitchListTile(
            title: const Text("Pakan Otomatis"),
            subtitle: const Text("Pemberian pakan akan dilakukan secara otomatis"),
            value: controller.isFeedAuto.value,
            onChanged:(value) => controller.setFeedAuto(value),
          )),
          Obx(() => SwitchListTile(
            title: const Text("Air Otomatis"),
            subtitle: const Text("Pengisian air akan dilakukan secara otomatis"),
            value: controller.isWaterAuto.value,
            onChanged: (value) => controller.setWaterAuto(value),
          )),
          ListTextWidget(text: "Ambang Batas"),
          ListTile(
            onTap:() => {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: ThresholdSpinboxWidget(
                    currentMin: controller.tempMin.value,
                    currentMax: controller.tempMax.value,
                    onChangedMin: controller.setTempMin,
                    onChangedMax: controller.setTempMax,
                    onPressed: () => onPressed(
                      controller.tempMinTemp.value,
                      controller.tempMaxTemp.value,
                      () => controller.setFinalTemp(),
                    ),
                    parameter: "Suhu",
                    max: 100,
                  ),
                ),
              )
            },
            title: const Text("Suhu"),
            subtitle: Obx(() => Text("Min ${controller.tempMin} | Max ${controller.tempMax}")),
          ),
          ListTile(
            onTap:() => {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: ThresholdSpinboxWidget(
                    currentMin: controller.phMin.value,
                    currentMax: controller.phMax.value,
                    onChangedMin: controller.setPhMin,
                    onChangedMax: controller.setPhMax,
                    onPressed: () => onPressed(
                      controller.phMinTemp.value,
                      controller.phMaxTemp.value,
                      () => controller.setFinalPh(),
                    ),
                    parameter: "pH",
                    max: 14,
                  ),
                ),
              )
            },
            title: const Text("pH"),
            subtitle: Obx(() => Text("Min ${controller.phMin} | Max ${controller.phMax}")),
          ),
          ListTile(
            onTap:() => {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: ThresholdSpinboxWidget(
                    currentMin: controller.tdoMin.value,
                    currentMax: controller.tdoMax.value,
                    onChangedMin: controller.setTdoMin,
                    onChangedMax: controller.setTdoMax,
                    onPressed: () => onPressed(
                      controller.tdoMinTemp.value,
                      controller.tdoMaxTemp.value,
                      () => controller.setFinalTdo(),
                    ),
                    parameter: "TDO",
                    max: 10000,
                  ),
                ),
              )
            },
            title: const Text("TDO"),
            subtitle: Obx(() => Text("Min ${controller.tdoMin} | Max ${controller.tdoMax}")),
          ),
          ListTile(
            onTap:() => {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: ThresholdSpinboxWidget(
                    currentMin: controller.tdsMin.value,
                    currentMax: controller.tdsMax.value,
                    onChangedMin: controller.setTdsMin,
                    onChangedMax: controller.setTdsMax,
                    onPressed: () => onPressed(
                      controller.tdsMinTemp.value,
                      controller.tdsMaxTemp.value,
                      () => controller.setFinalTds(),
                    ),
                    parameter: "TDS",
                    max: 10000,
                  ),
                ),
              )
            },
            title: const Text("TDS"),
            subtitle: Obx(() => Text("Min ${controller.tdsMin} | Max ${controller.tdsMax}")),
          ),
          ListTile(
            onTap:() => {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: ThresholdSpinboxWidget(
                    currentMin: controller.turbidityMin.value,
                    currentMax: controller.turbidityMax.value,
                    onChangedMin: controller.setTurbiditasMin,
                    onChangedMax: controller.setTurbiditasMax,
                    onPressed: () => onPressed(
                      controller.turbidityMinTemp.value,
                      controller.turbidityMaxTemp.value,
                      () => controller.setFinalTurbidity(),
                    ),
                    parameter: "TDS",
                    max: 10000,
                  ),
                ),
              ),
            },
            title: const Text("Turbiditas"),
            subtitle: Obx(() => Text("Min ${controller.turbidityMin} | Max ${controller.turbidityMax}")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        child: const Icon(Icons.save),
      )
    );
  }
}