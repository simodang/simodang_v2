import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/detail/detail_controller.dart';
import 'package:simodang_v2/presentation/android/detail/widgets/lists/label_column_widget.dart';
import 'package:simodang_v2/presentation/android/detail/widgets/lists/pill_column_widget.dart';
import 'package:simodang_v2/presentation/android/detail/widgets/lists/stat_column_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/title_widget.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
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
              child: Image.network(
                "https://placehold.co/600x400/png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            TitleWidget(title: "Kolam Ikan Dugong Yang Diberkati Oleh Kuasa Tuhan Yang Maha Esa"),
            const SizedBox(height: 10),
            const Text("Jl. Raya Dugong No. 1, Dugong, Kec. Dugong, Kab. Dugong, Prov. Dugong"),
            const SizedBox(height: 10),
            const Text(
              "Kondisi Kolam",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            PillColumnWidget(),
            const SizedBox(height: 15),
            const Text(
              "Informasi Kolam",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            LabelColumnWidget(),
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
