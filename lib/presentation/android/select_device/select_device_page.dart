import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/presentation/android/select_device/select_device_controller.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';

class SelectDevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectDeviceController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Pilih Perangkat"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Obx(() => RowLabelWidget(
                  label: "Perangkat Aktif",
                  value: controller.deviceIdState.value,
                )),
                const SizedBox(height: 20),
                Obx(() => DropdownMenu(
                  expandedInsets: const EdgeInsets.all(0),
                  dropdownMenuEntries: controller.devices.map((device) {
                    return DropdownMenuEntry(
                      value: device,
                      label: "${device.id} (${device.name})",
                    );
                  }).toList(),
                  onSelected: (Device? device) {
                    if (device != null) {
                      controller.setDeviceId(device.id);
                    }
                  },
                )),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () async {
                    await Get.dialog(
                      AlertDialog(
                        title: const Text("Peringatan"),
                        content: const Text("Apakah Anda yakin ingin melepaskan perangkat ini?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Batal"),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.setDeviceId("Tidak Ada");
                              Get.back();
                            },
                            child: const Text("Ya"),
                          )
                        ],
                      )
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)
                  ),
                  child: const Text("Lepas Perangkat"),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.back(result: controller.deviceIdState.value);
            },
            child: const Icon(Icons.save),
          ),
        );
      },
    );
  }
}