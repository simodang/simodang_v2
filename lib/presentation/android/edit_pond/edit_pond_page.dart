import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simodang_v2/presentation/android/edit_pond/edit_pond_controller.dart';
import 'package:simodang_v2/presentation/android/edit_pond/widgets/device_container_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/bottoms/imagepick_container_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/list_text_widget.dart';

class EditPondPage extends GetView<EditPondController> {

  ImageProvider<Object> getImage (bool isChanged) {
    if (isChanged) {
      return FileImage(File(controller.pondImage.value));
    } else {
      return NetworkImage(controller.pondImage.value);
    }
  }

  List<String> devices = [
    "SN-1234567890",
    "SN-1234567891",
    "SN-1234567892",
    "SN-1234567893",
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(EditPondController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Kolam"),
      ),
      body: ListView(
        children: [
          Obx(() => Image(
            image: getImage(controller.isImageChanged.value),
            fit: BoxFit.cover,
          )),
          const SizedBox(height: 15),
          ListTextWidget(text: "Informasi Umum"),
          ListTile(
            title: const Text("Nama Kolam"),
            subtitle: Obx(() => Text(controller.pondName.value)),
            onTap: () => {
              Get.toNamed("/editfield", arguments: {
                'field': "Nama Kolam",
                'value': controller.pondName.value,
                'isNumber': false,
              })?.then((value) {
                if (value != null) {
                  controller.setPondName(value);
                }
              })
            },
          ),
          ListTile(
            title: const Text("Alamat"),
            subtitle: Obx(() => Text(controller.pondAddress.value)),
            onTap: () => {
              Get.toNamed("/editfield", arguments: {
                'field': "Alamat Kolam",
                'value': controller.pondAddress.value,
                'isNumber': false,
              })?.then((value) {
                if (value != null) {
                  controller.setPondAddress(value);
                }
              })
            },
          ),
          ListTile(
            title: const Text("Kota"),
            subtitle: Obx(() => Text(controller.pondCity.value)),
            onTap: () => {
              Get.toNamed("/editfield", arguments: {
                'field': "Kota Kolam",
                'value': controller.pondCity.value,
                'isNumber': false,
              })?.then((value) {
                if (value != null) {
                  controller.setPondCity(value);
                }
              })
            },
          ),
          ListTile(
            title: const Text("Gambar"),
            subtitle: const Text("Ubah Gambar Kolam"),
            onTap:() {
              Get.bottomSheet(
                ImagePickContainerWidget(
                  setImageUrl: controller.setPondImage,
                )
              );
            },
          ),
          ListTextWidget(text: "Informasi Benih"),
          ListTile(
            title: const Text("Jumlah Benih"),
            subtitle: Obx(() => Text(controller.seedCount.value.toString())),
            onTap: () => {
              Get.toNamed("/editfield", arguments: {
                'field': "Jumlah Benih",
                'value': controller.seedCount.value,
                'isNumber': true,
              })?.then((value) {
                if (value != null) {
                  controller.setSeedCount(value);
                }
              })
            },
          ),
          ListTile(
            title: const Text("Tanggal Masuk"),
            subtitle: Obx(() => Text(controller.seedDate.value)),
            onTap:() async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2030),
              );

              if (pickedDate != null) {
                controller.setFinalSeedDate(pickedDate);
              }
            },
          ),
          Obx(() => SwitchListTile(
            title: const Text("Kolam Terisi"),
            subtitle: const Text("Kolam sudah terisi benih"),
            value: controller.isFilled.value,
            onChanged: (value) => {
              controller.setIsFilled(value)
            },
          )),
          ListTextWidget(text: "Informasi Perangkat"),
          ListTile(
            title: const Text("Kode Perangkat"),
            subtitle: Obx(() => Text(controller.deviceId.value)),
            onTap: () => {
              Get.toNamed("/selectdevice", arguments: {
                'deviceId': controller.deviceId.value,
              })?.then((value) {
                if (value == null) {
                  return;
                }
                if (value == "Tidak Ada") {
                  controller.setDeviceId("Tidak Ada");
                  controller.setIsNoDevice(true);
                  return;
                }
                controller.setDeviceId(value);
              })
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.check),
      )
    );
  }
}