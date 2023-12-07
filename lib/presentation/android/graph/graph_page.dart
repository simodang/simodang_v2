import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/graph/graph_controller.dart';
import 'package:simodang_v2/presentation/android/graph/widgets/current_value_widget.dart';
import 'package:simodang_v2/presentation/android/graph/widgets/lists/value_list_widget.dart';
import 'package:simodang_v2/presentation/android/graph/widgets/time_chip_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPage extends GetView<GraphController> {
  @override
  Widget build(BuildContext context) {
    Get.put(GraphController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          20, // left
          40, // top
          20, // right
          20, // bottom
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "pH",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.calendar_month),
                  onPressed: () => Get.toNamed('/datepicker')),
              ],
            ),
            const SizedBox(height: 10),
            CurrentValueWidget(),
            SizedBox(height: 15),
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                    dataSource: <SalesData>[
                      SalesData('Jan', 35),
                      SalesData('Feb', 28),
                      SalesData('Mar', 34),
                      SalesData('Apr', 80),
                      SalesData('May', 40)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true)
                  )
              ],
            ),
            // GraphSegmentedWidget(),
            Row(
              children: [
                Spacer(),
                Obx(() => TimeChip(
                  timeList: controller.timeList,
                  currentIndex: controller.currentIndex.value,
                  onSelected: controller.changeIndex,)),
                Spacer()
              ],
            ),
            SizedBox(height: 15),
            ValueListWidget()
          ],
      ),
      )
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
