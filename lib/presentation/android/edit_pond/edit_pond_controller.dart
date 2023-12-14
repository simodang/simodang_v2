import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditPondController extends GetxController {
  var pondName = "Kolam Ikan Dugong Yang Diberkati Oleh Kuasa Tuhan Yang Maha Esa".obs;
  var pondNameTemp = "".obs;
  var pondAddress = "Jl. Seat of Divine Foresight, Exalting Sanctum".obs;
  var pondAddressTemp = "".obs;
  var pondCity = "Xianzhou Luofu".obs;
  var pondCityTemp = "".obs;
  var pondImage = "https://placehold.co/600x400/png".obs;
  var seedCount = "911".obs;
  var seedCountTemp = "911".obs;
  var seedDate = "21 Desember 2012".obs;
  var isFilled = true.obs;
  var deviceId = "SN-1234567890".obs;

  var isImageChanged = false.obs;
  var isNoDevice = false.obs;

  setPondName(String pondName) {
    pondNameTemp.value = pondName;
  }
  setFinalPondName() {
    pondName.value = pondNameTemp.value;
  }

  setPondAddress(String pondAddress) {
    pondAddressTemp.value = pondAddress;
  }
  setFinalPondAddress() {
    pondAddress.value = pondAddressTemp.value;
  }

  setPondCity(String pondCity) {
    this.pondCity.value = pondCity;
  }
  setFinalPondCity() {
    pondCity.value = pondCity.value;
  }

  setPondImage(String pondImage) {
    isImageChanged.value = true;
    this.pondImage.value = pondImage;
  }

  setSeedCount(String seedCount) {
    seedCountTemp.value = seedCount;
  }
  setFinalSeedCount() {
    seedCount.value = seedCountTemp.value.replaceAll(RegExp(r"\D"), "");
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