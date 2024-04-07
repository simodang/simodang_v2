import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/application/services/pond_services.dart';

class PondState extends GetxController {
  final pondService = PondService();
  RxList<Pond> ponds = <Pond>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPonds();
  }

  void getPonds() async {
    try {
      isLoading(true);
      final pondsData = await pondService.getPonds();
      ponds.assignAll(pondsData);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  List<Pond> getLastFive() {
    return ponds.take(5).toList();
  }

  void refreshPonds() {
    getPonds();
  }
}