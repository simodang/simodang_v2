import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/application/services/pond_services.dart';

class DetailController extends GetxController {
  DetailController({
    required this.id
  });
  final String id;

  final pondService = PondService();

  RxString name = "".obs;
  RxString address = "".obs;
  RxString imageUrl = "https://placehold.co/600x400/png".obs;
  RxBool isFilled = false.obs;
  RxBool status = false.obs;
  RxString seedDate = "2010-05-01T00:00:00.000Z".obs;
  RxInt seedCount = 0.obs;
  RxString deviceId = "".obs;

  @override
  void onInit() {
    super.onInit();
    getPond(id);
  }

  Future<void> getPond(String id) async {
    final Pond pond = await pondService.getPond(id);
    name.value = pond.name;
    address.value = pond.address;
    imageUrl.value = pond.imageUrl;
    isFilled.value = pond.isFilled;
    status.value = pond.status;
    seedDate.value = pond.seedDate;
    seedCount.value = pond.seedCount;
    deviceId.value = pond.deviceId;
  }
}