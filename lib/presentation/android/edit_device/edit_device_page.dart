import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/edit_device/edit_device.controller.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/list_text_widget.dart';

class EditDevicePage extends GetView<EditDeviceController> {
  final String pondId = Get.arguments['pondId'];
  final String deviceId = Get.arguments['deviceId'];

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
            onTap: () {
              Get.toNamed("/editthreshold", arguments: {
                'param': "Suhu",
                'low': controller.tempLow.value,
                'high': controller.tempHigh.value,
                'max': 100,
              })?.then((value) {
                if (value != null) {
                  controller.setTempLow(value['low']);
                  controller.setTempHigh(value['high']);
                }
              });
            },
            title: const Text("Suhu"),
            subtitle: Obx(() => Text("Min ${controller.tempLow} | Max ${controller.tempHigh}")),
          ),
          ListTile(
            onTap: () {
              Get.toNamed("/editthreshold", arguments: {
                'param': "pH",
                'low': controller.phLow.value,
                'high': controller.phHigh.value,
                'max': 100,
              })?.then((value) {
                if (value != null) {
                  controller.setPhLow(value['low']);
                  controller.setPhHigh(value['high']);
                }
              });
            },
            title: const Text("pH"),
            subtitle: Obx(() => Text("Min ${controller.phLow} | Max ${controller.phHigh}")),
          ),
          ListTile(
            onTap: () {
              Get.toNamed("/editthreshold", arguments: {
                'param': "TDO",
                'low': controller.tdoLow.value,
                'high': controller.tdoHigh.value,
                'max': 100,
              })?.then((value) {
                if (value != null) {
                  controller.setTdoLow(value['low']);
                  controller.setTdsHigh(value['high']);
                }
              });
            },
            title: const Text("TDO"),
            subtitle: Obx(() => Text("Min ${controller.tdoLow} | Max ${controller.tdsHigh}")),
          ),
          ListTile(
            onTap: () {
              Get.toNamed("/editthreshold", arguments: {
                'param': "TDS",
                'low': controller.tdoLow.value,
                'high': controller.tdoHigh.value,
                'max': 100,
              })?.then((value) {
                if (value != null) {
                  controller.setTdsLow(value['low']);
                  controller.setTdsHigh(value['high']);
                }
              });
            },
            title: const Text("TDS"),
            subtitle: Obx(() => Text("Min ${controller.tdsLow} | Max ${controller.tdsHigh}")),
          ),
          ListTile(
            onTap: () {
              Get.toNamed("/editthreshold", arguments: {
                'param': "Turbiditas",
                'low': controller.turbiditiesLow.value,
                'high': controller.turbiditiesHigh.value,
                'max': 100,
              })?.then((value) {
                if (value != null) {
                  controller.setTurbiditiesLow(value['low']);
                  controller.setTurbiditiesHigh(value['high']);
                }
              });
            },
            title: const Text("Turbiditas"),
            subtitle: Obx(() => Text("Min ${controller.turbiditiesLow} | Max ${controller.turbiditiesHigh}")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.updateDevice(pondId),
        child: const Icon(Icons.save),
      )
    );
  }
}