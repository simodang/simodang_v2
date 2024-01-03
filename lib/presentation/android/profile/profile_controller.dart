import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/user.dart';
import 'package:simodang_v2/application/services/user_service.dart';

class ProfileController extends GetxController {
  final userService = UserService();

  var name = "".obs;
  var email = "".obs;
  var photo = "https://placehold.co/400x400/png".obs;

  var address = "".obs;
  var addressTemp = "".obs;
  var phoneNum = "".obs;
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

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  void getProfile() async {
    final User user = await userService.getUser();
    name.value = user.name;
    email.value = user.email;
    photo.value = user.photo;
    address.value = user.address;
    phoneNum.value = user.phoneNum;
  }
}