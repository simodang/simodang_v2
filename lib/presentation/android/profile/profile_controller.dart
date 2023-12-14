import 'package:get/get.dart';

class ProfileController extends GetxController {
  var address = "Malang, Indonesia".obs;
  var addressTemp = "".obs;
  var phoneNum = "08272732323".obs;
  var phoneNumTemp = "".obs;

  setAddressTemp(String address) {
    addressTemp.value = address;
  }

  setPhoneTemp(String phoneNum) {
    phoneNumTemp.value = phoneNum;
  }

  setFinal() {
    address.value = addressTemp.value;
    phoneNum.value = phoneNumTemp.value;
  }
}