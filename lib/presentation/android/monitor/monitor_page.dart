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
              child: Obx(() =>  controller.pondState.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: controller.pondState.ponds.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                ),
                itemBuilder:(context, index) => Card(
                  child: PondItemWidget(
                    title: controller.pondState.ponds[index].name,
                    address: controller.pondState.ponds[index].city,
                    imageUrl: controller.pondState.ponds[index].imageUrl,
                    onTap: () async {
                      await Get.toNamed(
                        '/detail?id=${controller.pondState.ponds[index].id}'
                      )?.then((value) {
                        controller.pondState.refreshPonds();
                      });
                    }
                  )
                ),
              )),
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed('/addpond')?.then((value) {
            controller.pondState.refreshPonds();
          });
        },
        child: const Icon(Icons.add),
      )
    );
  }
}