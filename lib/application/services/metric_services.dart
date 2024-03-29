import 'dart:convert';

import 'package:simodang_v2/application/data/models/metric.dart';
import 'package:simodang_v2/application/providers/networks/apis/metric_api.dart';

class MetricService {
  Future<List<Metric>> getMetrics(String pondId, int hours) async {
    final isoDate = DateTime.now().toUtc().toIso8601String();

    final response = await MetricAPI().getMetrics(pondId, isoDate, hours);
    final List<dynamic> metrics = jsonDecode(response.body);

    return metrics.map((e) => Metric.fromJson(e)).toList();
  }

  Future<List<Metric>> getAverageMetrics(String pondId, String startDate, String endDate) async {
    final response = await MetricAPI().getAverageMetrics(pondId, startDate, endDate);
    final List<dynamic> metrics = jsonDecode(response.body);

    print("service called");

    return metrics.map((e) => Metric.fromJson(e)).toList();
  }
}