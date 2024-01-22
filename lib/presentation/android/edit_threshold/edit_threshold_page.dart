import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/edit_threshold/edit_threshold_controller.dart';

class EditThresholdPage extends GetView<EditThresholdController> {
  @override
  Widget build(BuildContext context) {
    Get.put(EditThresholdController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Batas ${controller.parameter}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SpinBox(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Batas Atas ${controller.parameter}',
              ),
              min: 0,
              max: controller.maxState.value,
              value: controller.highValueState.value,
              onChanged: (value) {
                controller.setHighValue(value);
              }
            ),
            const SizedBox(height: 20),
            SpinBox(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Batas Bawah ${controller.parameter}',
              ),
              min: 0,
              max: controller.maxState.value,
              value: controller.lowValueState.value,
              onChanged: (value) {
                controller.setLowValue(value);
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.save(),
        child: const Icon(Icons.save),
      )
    );
  }
}