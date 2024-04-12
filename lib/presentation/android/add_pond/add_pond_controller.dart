import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:mime/mime.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/application/services/device_service.dart';
import 'package:simodang_v2/application/services/pond_services.dart';

class AddPondController extends GetxController {
  Rx<TextEditingController> pondNameController = TextEditingController().obs;
  Rx<TextEditingController> pondAddressController = TextEditingController().obs;
  Rx<TextEditingController> pondCityController = TextEditingController().obs;
  RxBool isFilled = true.obs;
  RxnString deviceId = RxnString();
  RxString imageUrl = ''.obs;

  var noDevice = false.obs;
  RxString imagePreview = ''.obs;
  RxBool isQrScanned = false.obs;

  RxList<Device> devices = <Device>[].obs;

  void setIsFilled(bool isFilled) {
    this.isFilled.value = isFilled;
  }

  void setDeviceId(String? deviceId) {
    this.deviceId.value = deviceId;
  }

  void setNoDevice(bool noDevice) {
    this.noDevice.value = noDevice;
  }

  void setImageUrl(String imageUrl) {
    this.imageUrl.value = imageUrl;
  }

  void setImagePreview(String imagePreview) {
    this.imagePreview.value = imagePreview;
  }

  void setIsQrScanned(bool isQrScanned) {
    this.isQrScanned.value = isQrScanned;
  }

  Future<void> pickImageCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 10
    );
    if (pickedFile != null) {
      setImagePreview(pickedFile.path);
    }
  }

  Future<void> pickImageGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 25
    );
    if (pickedFile != null) {
      setImagePreview(pickedFile.path);
    }
  }

  Future<String> uploadImage() async {
    File image = File(imagePreview.value);
    String extention = path.extension(image.path);

    final ref = FirebaseStorage
      .instance
      .ref()
      .child("simodang-flutter/${DateTime.now().microsecondsSinceEpoch}$extention");

    await ref.putFile(image, SettableMetadata(contentType: lookupMimeType(image.path)));
    final url = await ref.getDownloadURL();
    return url;
  }

  Future<void> scanQr() async {
    dynamic qrResult = await Get.toNamed('/qr');
    if (qrResult == null) {
      return;
    }

    var filtered = devices.where((element) => element.id == qrResult);
    if (filtered.isEmpty) {
      Get.snackbar(
        "Error",
        "Perangkat tidak ditemukan",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    setIsQrScanned(true);
    setDeviceId(qrResult);
  }

  Future<void> createPond() async {
    if (pondNameController.value.text == "") {
      return;
    }

    if (pondAddressController.value.text == "") {
      return;
    }

    if (pondCityController.value.text == "") {
      return;
    }

    if (deviceId.value == "") {
      return;
    }

    if (noDevice.value) {
      setDeviceId(null);
    }

    if (imagePreview.value != "") {
      final url = await uploadImage();
      setImageUrl(url);
    }

    Pond pond = Pond(
      id: "",
      seedCount: 0,
      seedDate: DateTime.now().toUtc().toIso8601String(),
      status: false,
      name: pondNameController.value.text,
      address: pondAddressController.value.text,
      city: pondCityController.value.text,
      isFilled: isFilled.value,
      deviceId: deviceId.value ?? "",
      imageUrl: imageUrl.value,
      createdAt: DateTime.now().toUtc().toIso8601String(),
      userId: "",
    );

    // print(pond.toJson());
    await PondService().createPond(pond);
  }

  Future<List<Device>> getDevices() async {
    List<Device> devices = await DeviceService().getDevices();
    return devices;
  }

  @override
  void onInit() {
    super.onInit();
    getDevices().then((value) {
      devices.value = value;
    });
  }
}