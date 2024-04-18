import 'package:get/get.dart';

class EditFieldController extends GetxController {
  final String field = Get.arguments['field'];
  final bool isNumber = Get.arguments['isNumber'].toString() == "true";
  final String value = Get.arguments['value'].toString();

  RxString valueState = "".obs;

  @override
  void onInit() {
    super.onInit();
    valueState.value = value;
  }

  void setValue(String value) => valueState.value = value;

  void save() {
    Get.back(result: valueState.value);
  }
}