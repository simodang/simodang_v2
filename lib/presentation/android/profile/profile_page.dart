import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/profile/profile_controller.dart';
import 'package:simodang_v2/presentation/android/profile/widgets/edit_profile_container_widget.dart';
import 'package:simodang_v2/presentation/android/profile/widgets/profile_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/rounded_label_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/list_text_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Obx(() => ProfileWidget(
                  name: controller.name.value,
                  email: controller.email.value,
                  image: controller.photo.value,
                )),
                const SizedBox(height: 20),
                Obx(() => RowLabelWidget(
                  label: "Alamat",
                  value: controller.address.value,
                )),
                const SizedBox(height: 15),
                Obx(() => RowLabelWidget(
                  label: "No. HP",
                  value: controller.phoneNum.value,
                )),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    RoundedLabel(
                      title: "Perangkat",
                      value: 5,
                    ),
                    SizedBox(width: 15),
                    RoundedLabel(
                      title: "Master",
                      value: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTextWidget(text: "Perangkat"),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Beli Perangkat"),
            onTap: () => {},
          ),
          ListTextWidget(text: "Bantuan"),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Panduan"),
            onTap: () => {},
          ),
          ListTextWidget(text: "Akun"),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Atur Profil"),
            onTap: () {
              Get.bottomSheet(
                EditProfileContainerWidget(
                  addressInitialValue: controller.address.value,
                  phoneInitialValue: controller.phoneNum.value,
                  setAddressTemp: controller.setAddressTemp,
                  setPhoneTemp: controller.setPhoneTemp,
                  setFinal: controller.setFinal,
                )
              );
            },
          ),
        ]
      )
    );
  }
}