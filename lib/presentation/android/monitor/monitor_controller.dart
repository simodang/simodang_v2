import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/application/services/pond_services.dart';

class MonitorController extends GetxController {
  final pondService = PondService();
  RxList<Pond> ponds = <Pond>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPonds();
  }

  void getPonds() async {
    final List<Pond> ponds = await pondService.getPonds();
    this.ponds.value = ponds.take(5).toList();
  }
}