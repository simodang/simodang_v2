import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/monitor/monitor_controller.dart';
import 'package:simodang_v2/presentation/android/monitor/widgets/lists/pond_grid_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/lists/pond_item_widget.dart';

class MonitorPage extends GetView<MonitorController> {
  @override
  Widget build(BuildContext context) {
    Get.put(MonitorController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          20, // left
          60, // top
          20, // right
          20, // bottom
        ),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.blue,
                border: OutlineInputBorder(),
                labelText: "Cari Disini"
              ),
            ),
            // PondGridWidget(),
            Flexible(
              child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: controller.ponds.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
              ),
              itemBuilder:(context, index) => Card(
                child: PondItemWidget(
                  title: controller.ponds[index].name,
                  address: controller.ponds[index].city,
                  imageUrl: controller.ponds[index].imageUrl,
                )
              ),
            ),
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/addpond'),
        child: const Icon(Icons.add),
      )
    );
  }
}