import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/monitor/monitor_controller.dart';
import 'package:simodang_v2/presentation/android/monitor/widgets/lists/pond_grid_widget.dart';

class MonitorPage extends GetView<MonitorController> {
  @override
  Widget build(BuildContext context) {
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
            PondGridWidget(),
          ]
        ),
      )
    );
  }
}