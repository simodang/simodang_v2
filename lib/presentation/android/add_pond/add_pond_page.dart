import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/add_pond/add_pond_controller.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/title_button_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/text_button_widget.dart';

class AddPondPage extends GetView<AddPondController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddPondController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kolam"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Obx(() => TextField(
                controller: controller.pondNameController.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama Kolam"
                ),
              )),
              const SizedBox(height: 20),
              Obx(() => TextField(
                controller: controller.pondAddressController.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Alamat Kolam"
                ),
              )),
              const SizedBox(height: 20),
              Obx(() => TextField(
                controller: controller.pondCityController.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kota Kolam"
                ),
              )),
              const SizedBox(height: 20),
              const Text("Status Kolam", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                children: ['Terisi', 'Tidak terisi'].map((status) => Obx(() => ChoiceChip(
                  label: Text(status),
                  selected: controller.isFilled.value == (status == 'Terisi'),
                  onSelected: (bool selected) {
                    controller.setIsFilled(status == 'Terisi');
                  },
                ))).toList(),
              ),
              TitleButtonWidget(
                title: "Perangkat",
                buttonText: "Scan QR",
                disabled: false,
                onPressed: () {
                  controller.scanQr();
                },
              ),
              Obx(() => controller.isQrScanned.value == true ? 
                TextButtonWidget(
                  text: controller.deviceId.value ?? "",
                  buttonLabel: "Batal QR",
                  onPressed: () {
                    controller.setIsQrScanned(false);
                    controller.setDeviceId(null);
                  },
                ) :
                const SizedBox.shrink(),
              ),
              const SizedBox(height: 10),
              Obx(() => Visibility(
                visible: controller.noDevice.value == false,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Perangkat"
                  ),
                  value: controller.deviceId.value,
                  onChanged: (value) {
                    controller.setDeviceId(value.toString());
                  },
                  items: controller.devices.map((e) => DropdownMenuItem(
                    value: e.id,
                    child: Text('${e.id} - ${e.name}'),
                  )).toList(),
                ),
              )),
              Obx(() => CheckboxListTile(
                title: const Text("Tidak menggunakan perangkat"),
                value: controller.noDevice.value,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                onChanged: (bool? value) {
                  controller.setNoDevice(value ?? false);
                },
              )),
              TitleButtonWidget(
                title: "Gambar Kolam",
                buttonText: "Tambahkan",
                disabled: false,
                onPressed: () {
                  // give bottomsheet a background color
                  Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      child: Wrap(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            leading: const Icon(Icons.camera_alt),
                            title: const Text("Kamera"),
                            onTap: () {
                              controller.pickImageCamera();
                              Get.back();
                            },
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            leading: const Icon(Icons.image),
                            title: const Text("Galeri"),
                            onTap: () {
                              controller.pickImageGallery();
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Obx(() => controller.imagePreview.value != '' ?
                Image.file(File(controller.imagePreview.value)) :
                const Text("Belum ada gambar")
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.createPond();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}