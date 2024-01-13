import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/metric.dart';
import 'package:simodang_v2/application/services/metric_services.dart';

class GraphController extends GetxController {
  final String pondId = Get.parameters['id']!;

  List<String> timeList = [
    '1h',
    '3h',
    '12h',
    '1d',
  ];

  List<int> timeValue = [
    1,
    3,
    12,
    24,
  ];

  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Future<List<Metric>> getMetrics(int index) async {
    List<Metric> metrics = await MetricService().getMetrics(pondId, timeValue[index]);
    return metrics;
  }
}