import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/detail/detail_controller.dart';
import 'package:simodang_v2/presentation/android/detail/widgets/lists/label_column_widget.dart';
import 'package:simodang_v2/presentation/android/detail/widgets/lists/pill_column_widget.dart';
import 'package:simodang_v2/presentation/android/detail/widgets/lists/stat_column_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/title_widget.dart';

class DetailPage extends GetView<DetailController> {
  final String pondId = Get.parameters['id']!;

  @override
  Widget build(BuildContext context) {
    Get.put(DetailController(id: pondId));

    return Scaffold(
      appBar: AppBar(
        // title: const Text("Detail Kolam"),
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("Edit Kolam"),
              onTap: () => Get.toNamed("/editpond"),
            ),
            PopupMenuItem(
              child: Text("Atur Perangkat"),
              onTap: () => Get.toNamed("/editdevice"),
            ),
          ]
          )
        ]
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Obx(() => Image.network(
                controller.imageUrl.value,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              )),
            ),
            const SizedBox(height: 20),
            Obx(() => TitleWidget(title: controller.name.value)),
            const SizedBox(height: 10),
            Obx(() => Text(controller.address.value)),
            const SizedBox(height: 10),
            const Text(
              "Kondisi Kolam",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() => PillColumnWidget(
              isFilled: controller.isFilled.value,
              status: controller.status.value,
            )),
            const SizedBox(height: 15),
            const Text(
              "Informasi Kolam",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Obx(() => LabelColumnWidget(
              seedDate: controller.seedDate.value,
              seedCount: controller.seedCount.value,
            )),
            const SizedBox(height: 15),
            const Text(
              "Grafik Metrik Terbaru",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            StatColumnWidget(),
          ],
        ),
        )
      )
    );
  }
}
