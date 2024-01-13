import 'package:flutter/material.dart';
import 'package:simodang_v2/application/data/models/metric.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MetricChartWidget extends StatelessWidget {
  const MetricChartWidget({
    super.key,
    required this.metrics,
    required this.metricType,
  });

  final List<Metric> metrics;
  final String metricType;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        isVisible: false,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        zoomMode: ZoomMode.x,
        enablePinching: true,
      ),
      series: <LineSeries<Metric, String>>[
        LineSeries<Metric, String>(
          dataSource: metrics,
          xValueMapper: (Metric metric, _) {
            return metric.getTime();
          },
          yValueMapper: (Metric metric, _) {
            return metric.getMetric(metricType);
          },
        )
      ]
    );
  }
}