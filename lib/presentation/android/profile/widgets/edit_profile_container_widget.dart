import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/subtitle_widget.dart';

class EditProfileContainerWidget extends StatelessWidget {
  const EditProfileContainerWidget({
    super.key,
    required this.addressInitialValue,
    required this.phoneInitialValue,
    required this.setAddressTemp,
    required this.setPhoneTemp,
    required this.setFinal,
  });

  final String addressInitialValue;
  final String phoneInitialValue;
  final Function setAddressTemp;
  final Function setPhoneTemp;
  final Function setFinal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SubtitleWidget(text: "Edit Profil"),
              const Spacer(),
              TextButton(
                onPressed: () => {
                  Get.key.currentState?.pop(),
                  setFinal()
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            initialValue: addressInitialValue,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Alamat",
            ),
            onChanged: (value) => setAddressTemp(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: phoneInitialValue,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nomor Telepon",
            ),
            onChanged: (value) => setPhoneTemp(value),
          ),
        ],
      ),
    );
  }
}