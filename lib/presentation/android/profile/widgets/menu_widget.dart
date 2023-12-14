import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/profile/widgets/edit_profile_container_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/list_text_widget.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
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
                  addressInitialValue: "Jl. Raya Bogor KM 39, Cijantung, Pasar Rebo, Jakarta Timur",
                  phoneInitialValue: "081234567890",
                  setAddressTemp: (value) => {},
                  setPhoneTemp: (value) => {},
                  setFinal: () => {},
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Keluar"),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}