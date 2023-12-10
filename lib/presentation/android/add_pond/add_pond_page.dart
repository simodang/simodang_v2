import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/add_pond/add_pond_controller.dart';
import 'package:simodang_v2/presentation/android/add_pond/widgets/add_pond_form_widget.dart';

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
        child: Obx(() => AddPondFormWidget(
          setQR: controller.setQR,
          qr: controller.qrResult.value,
          isFilled: controller.isFilled.value,
          setIsFilled: controller.setIsFilled,
          imageUrl: controller.imageUrl.value,
          setImageUrl: controller.setImageUrl,
          noDevice: controller.noDevice.value,
          setNoDevice: controller.setNoDevice,
        ))
      ),
    );
  }
}