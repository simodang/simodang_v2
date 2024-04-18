import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/edit_field/edit_field_controller.dart';

class EditFieldPage extends GetView<EditFieldController> {
  @override
  Widget build(BuildContext context) {
    Get.put(EditFieldController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${controller.field}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: controller.field,
              ),
              keyboardType: controller.isNumber ? TextInputType.number : TextInputType.text,
              controller: TextEditingController(text: controller.valueState.value),
              onChanged: (value) {
                controller.setValue(value);
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.save();
        },
        child: const Icon(Icons.save),
      )
    );
  }
}