import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:simodang_v2/presentation/android/qr_scan/qr_scan_controller.dart';


class QrScanPage extends GetView<QrScanController> {
  @override
  Widget build(BuildContext context) {
    Get.put(QrScanController());

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scan'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(() => Text(
              controller.qrResult.value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(height: 20),
            Expanded(
              child: QrCamera(
                onError: (context, error) => Text(
                  error.toString(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                qrCodeCallback: (code) {
                  controller.setQr(code ?? 'QR Belum Didapatkan');
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Obx(() => Visibility(
        visible: controller.isFound.value,
        child: FloatingActionButton(
          onPressed: () {
            Get.back(result: controller.qrResult.value);
          },
          child: const Icon(Icons.check),
        ),
      )),
    );
  }
}