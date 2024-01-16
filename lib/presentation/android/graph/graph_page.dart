import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/metric.dart';
import 'package:simodang_v2/presentation/android/graph/graph_controller.dart';
import 'package:simodang_v2/presentation/android/graph/widgets/current_value_widget.dart';
import 'package:simodang_v2/presentation/android/graph/widgets/lists/value_list_widget.dart';
import 'package:simodang_v2/presentation/android/graph/widgets/metric_chart_widget.dart';
import 'package:simodang_v2/presentation/android/graph/widgets/time_chip_widget.dart';

class GraphPage extends GetView<GraphController> {
  final String pondId = Get.parameters['id']!;
  final String property = Get.parameters['property'] ?? 'temperature';

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
                    Text(
                      Metric.empty().getCasedProperty(property),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.calendar_month),
                  onPressed: () => controller.pickDate(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(() => FutureBuilder(
              future: controller.getMetrics(
                controller.isAveraged.value,
                controller.currentIndex.value,
                controller.startDate.value,
                controller.endDate.value,
              ),
              builder: (context, AsyncSnapshot<List<Metric>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CurrentValueWidget(
                    lastMetric: () {
                      if (!snapshot.hasData) {
                        return Metric.empty();
                      }
                      if (snapshot.data!.isEmpty) {
                        return Metric.empty();
                      } else {
                        return snapshot.data!.last;
                      }
                    }(),
                    property: property,
                    startDate: DateTime.now(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
            Obx(() => FutureBuilder(
              future: controller.getMetrics(
                controller.isAveraged.value,
                controller.currentIndex.value,
                controller.startDate.value,
                controller.endDate.value,
              ),
              builder: (context, AsyncSnapshot<List<Metric>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No data'),
                    );
                  }
                  return MetricChartWidget(
                    isAveraged: controller.isAveraged.value,
                    metrics: snapshot.data!,
                    metricType: property,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
            Row(
              children: [
                const Spacer(),
                Obx(() => TimeChip(
                  timeList: controller.timeList,
                  currentIndex: controller.currentIndex.value,
                  onSelected: controller.changeIndex,)),
                const Spacer()
              ],
            ),
            const SizedBox(height: 15),
            Obx(() => FutureBuilder(
              future: controller.getMetrics(
                controller.isAveraged.value,
                controller.currentIndex.value,
                controller.startDate.value,
                controller.endDate.value,
              ),
              builder: (context, AsyncSnapshot<List<Metric>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No data'),
                    );
                  }
                  return ValueListWidget(
                    isAveraged: controller.isAveraged.value,
                    metrics: snapshot.data!,
                    property: property,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
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
