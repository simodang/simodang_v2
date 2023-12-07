import 'package:get/get.dart';

class GraphController extends GetxController {
  List<String> timeList = [
    '30m',
    '1h',
    '3h',
    '1d',
  ];

  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}