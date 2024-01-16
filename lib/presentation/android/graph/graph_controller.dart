import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/metric.dart';
import 'package:simodang_v2/application/services/metric_services.dart';

class GraphController extends GetxController {
  final String pondId = Get.parameters['id'] ?? 'undefined';

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

  RxInt currentIndex = 99.obs;

  RxBool isAveraged = true.obs;
  Rx<DateTime> startDate = DateTime.now().subtract(const Duration(days: 7)).obs;
  Rx<DateTime> endDate = DateTime.now().obs;

  void changeIndex(int index) {
    currentIndex.value = index;
    isAveraged.value = false;
  }

  Future<List<Metric>> getMetrics(
    bool isAveraged,
    int index,
    DateTime startDate,
    DateTime endDate,
  ) async {
    if (isAveraged) {
      List<Metric> metrics = await MetricService().getAverageMetrics(
        pondId,
        formatDate(startDate, [yyyy, '-', mm, '-', dd]),
        formatDate(endDate, [yyyy, '-', mm, '-', dd]),
      );
      return metrics;
    }
    List<Metric> metrics = await MetricService().getMetrics(pondId, timeValue[index]);
    return metrics;
  }

  void pickDate() {
    // add null check for below code please
    Get.toNamed('/datepicker')?.then((value) {
      if (value != null) {
        startDate.value = value['startDate'];
        endDate.value = value['endDate'];
        isAveraged.value = true;
        currentIndex.value = 99;
      }
    });
  }
}