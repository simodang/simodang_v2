import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickContainerWidget extends StatelessWidget {
  const ImagePickContainerWidget({
    super.key,
    required this.setImageUrl,
  });

  final Function setImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Ambil Gambar"),
            onTap: () async {
              Get.back();
              final image = await ImagePicker().pickImage(source: ImageSource.camera);

              if (image != null) {
                setImageUrl(image.path);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Pilih dari Galeri"),
            onTap: () async {
              Get.back();
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);

              if (image != null) {
                setImageUrl(image.path);
              }
            },
          ),
        ],
      ),
    );
  }
}