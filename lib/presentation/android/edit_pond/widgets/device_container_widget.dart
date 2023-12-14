import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/subtitle_widget.dart';

class DeviceContainerWidget extends StatelessWidget {
  const DeviceContainerWidget({
    super.key,
    required this.devices,
    required this.deviceId,
    required this.setDeviceId,
    required this.isNoDevice,
    required this.setIsNoDevice,
  });

  final List<String> devices;
  final String deviceId;
  final Function setDeviceId;
  final bool isNoDevice;
  final Function setIsNoDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              SubtitleWidget(text: "Perangkat"),
              const Spacer(),
              TextButton(
                onPressed: isNoDevice ? null : () => {
                  Get.toNamed('/qr')?.then((value) {
                    if (value != null) {
                      if (!devices.contains(value)) {
                        Get.snackbar(
                          "Error",
                          "QR Perangkat tidak ditemukan",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }

                      setDeviceId(value);
                    }
                  })
                },
                child: const Text("Scan QR"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownMenu(
            enabled: !isNoDevice,
            expandedInsets: EdgeInsets.zero,
            initialSelection: deviceId,
            dropdownMenuEntries: devices.map((e) {
              return DropdownMenuEntry(
                label: e,
                value: e,
              );
            }).toList(),
          ),
          CheckboxListTile(
            title: const Text("Kolam Tanpa Perangkat"),
            value: isNoDevice,
            onChanged: (value) {
              setIsNoDevice(value);
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () {
              setDeviceId(deviceId);
              Get.back();
            },
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text("Simpan"),
          )
        ],
      )
    );
  }
}