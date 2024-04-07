import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/presentation/state/pond_state.dart';

class MonitorController extends GetxController {
  final pondState = Get.put(PondState());
  RxList<Pond> ponds = <Pond>[].obs;
}