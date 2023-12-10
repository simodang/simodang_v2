import 'package:get/get.dart';

class EditPondController extends GetxController {
  var qrResult = "".obs;
  var isFilled = true.obs;
  var imageUrl = "https://placehold.co/600x400/png".obs;
  var noDevice = false.obs;

  void setQR(String qr) {
    qrResult.value = qr;
  }

  void setIsFilled(bool isFilled) {
    print(isFilled);
    this.isFilled.value = isFilled;
  }

  void setImageUrl(String imageUrl) {
    this.imageUrl.value = imageUrl;
  }

  void setNoDevice(bool noDevice) {
    this.noDevice.value = noDevice;
  }
}