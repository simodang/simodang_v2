import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/title_button_widget.dart';

class AddPondFormWidget extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  AddPondFormWidget({
    super.key,
    required this.setQR,
    required this.qr,
    required this.isFilled,
    required this.setIsFilled,
    required this.imageUrl,
    required this.setImageUrl,
    required this.noDevice,
    required this.setNoDevice,
  });

  final Function setQR;
  final String qr;
  final bool isFilled;
  final Function setIsFilled;
  final String imageUrl;
  final Function setImageUrl;
  final bool noDevice;
  final Function setNoDevice;

  List<String> devices = [
    "SN-1234567890",
    "SN-1234567891",
    "SN-1234567892",
    "SN-1234567893",
  ];

  @override
  Widget build(BuildContext context) {
    const deviceNotFoundSnackBar = SnackBar(
      content: Text("QR Perangkat tidak ditemukan"),
      backgroundColor: Colors.red,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nama Kolam"
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Alamat"
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Kota"
            ),
          ),
          const SizedBox(height: 20),
          const Text("Status Kolam", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            children: ['Terisi','Tidak terisi'].map((status) {
              return ChoiceChip(
                label: Text(status),
                selected: isFilled == (status == 'Terisi'),
                onSelected: (e) {
                  setIsFilled(status == 'Terisi');
                }
              );
            }).toList(),
          ),
          TitleButtonWidget(
            title: "Perangkat",
            buttonText: "Scan QR",
            disabled: noDevice,
            onPressed: () {
              Get.toNamed("/qr")?.then((value) {
                if (value != null) {
                  setQR(value);

                  if (!devices.contains(value)) {
                    ScaffoldMessenger.of(context).showSnackBar(deviceNotFoundSnackBar);
                  }
                }
              });
            },
          ),
          const SizedBox(height: 10),
          DropdownMenu(
            enabled: !noDevice,
            expandedInsets: const EdgeInsets.all(0),
            label: const Text("Perangkat"),
            initialSelection: qr,
            dropdownMenuEntries: devices.map((e) {
              return DropdownMenuEntry(
                label: e,
                value: e,
              );
            }).toList(),
          ),
          CheckboxListTile(
            title: const Text("Buat Kolam Tanpa Perangkat"),
            value: noDevice,
            onChanged: (value) {
              setNoDevice(value ?? false);
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          TitleButtonWidget(
            title: "Gambar Kolam",
            buttonText: "Tambahkan",
            disabled: false,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const ContinuousRectangleBorder(
                  // borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                ),
                builder: (context) {
                  return SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: const Text("Ambil Gambar"),
                          onTap: () async {
                            Navigator.of(context).pop();
                            final image = await ImagePicker().pickImage(source: ImageSource.camera);

                            if (image == null) return;

                            setImageUrl(image.path);

                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text("Pilih dari Galeri"),
                          onTap: () async {
                            Navigator.of(context).pop();
                            final image = await ImagePicker().pickImage(source: ImageSource.gallery);

                            if (image == null) return;

                            setImageUrl(image.path);

                          },
                        ),
                      ],
                    ),
                  );
                }
              );
            },
          ),
          const SizedBox(height: 10),
          imageUrl != '' ? Image.file(File(imageUrl)) : const Text("Belum ada gambar"),
        ],
      ),
    );
  }
}