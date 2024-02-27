import 'package:get/get.dart';

class QrScanController extends GetxController {
  RxString qrResult = 'QR Belum Didapatkan'.obs;
  RxBool isFound = false.obs;

  void setQr(String qr) {
    qrResult.value = qr;
    isFound.value = true;
  }
}
