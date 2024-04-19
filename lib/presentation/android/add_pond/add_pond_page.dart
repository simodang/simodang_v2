import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/add_pond/add_pond_controller.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';
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
              Obx(() => controller.isSubmitting.value == true ? 
                const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text("Menyimpan data kolam..."),
                      SizedBox(height: 20)
                    ],
                  )
                ) : const SizedBox.shrink()),
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
              const SizedBox(height: 20),
              Obx(() => RowLabelWidget(
                label: "Kode Perangkat",
                value: controller.deviceId.value ?? "Tidak Ada",
              )),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {
                  Get.toNamed("/selectdevice", arguments: {
                    'deviceId': controller.deviceId.value ?? "Tidak Ada",
                  })?.then((value) {
                    if (value == null) {
                      return;
                    }
                    if (value == "Tidak Ada") {
                      controller.setDeviceId(null);
                      controller.setNoDevice(true);
                      return;
                    }
                    controller.setDeviceId(value);
                  });
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)
                ),
                child: const Text("Pilih Perangkat"),
              ),
              const SizedBox(height: 20),
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
        onPressed: () async {
          await controller.createPond().then((value) {
            Get.back();
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}