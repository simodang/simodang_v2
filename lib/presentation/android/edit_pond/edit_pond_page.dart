import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/edit_pond/edit_pond_controller.dart';
import 'package:simodang_v2/presentation/android/edit_pond/widgets/edit_pond_form_widget.dart';

class EditPondPage extends GetView<EditPondController> {
  @override
  Widget build(BuildContext context) {
    Get.put(EditPondController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Kolam"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Obx(() => EditPondFormWidget(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.check),
      )
    );
  }
}