import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditPondController extends GetxController {
  var pondName = "Kolam Ikan Dugong Yang Diberkati Oleh Kuasa Tuhan Yang Maha Esa".obs;
  var pondAddress = "Jl. Seat of Divine Foresight, Exalting Sanctum".obs;
  var pondCity = "Xianzhou Luofu".obs;
  var pondImage = "https://placehold.co/600x400/png".obs;
  var seedCount = "911".obs;
  var seedDate = "21 Desember 2012".obs;
  var isFilled = true.obs;
  var deviceId = "idfi".obs;

  var isImageChanged = false.obs;
  var isNoDevice = false.obs;

  setPondName(String pondName) {
    this.pondName.value = pondName;
  }

  setPondAddress(String pondAddress) {
    this.pondAddress.value = pondAddress;
  }

  setPondCity(String pondCity) {
    this.pondCity.value = pondCity;
  }

  setPondImage(String pondImage) {
    isImageChanged.value = true;
    this.pondImage.value = pondImage;
  }

  setSeedCount(String seedCount) {
    this.seedCount.value = seedCount;
  }

  setDeviceId(String deviceId) {
    this.deviceId.value = deviceId;
  }

  setFinalSeedDate(DateTime seedDate) {
    this.seedDate.value = DateFormat("dd MMMM yyyy").format(seedDate);
  }

  setIsNoDevice(bool isNoDevice) {
    this.isNoDevice.value = isNoDevice;
  }
  
  setIsFilled(bool isFilled) {
    this.isFilled.value = isFilled;
  }
}