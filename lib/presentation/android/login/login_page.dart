import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),
            const Text("Atur kolam anda dari manapun dan kapanpun"),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () => Get.offAllNamed("/"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text("Masuk"),
            ),
            TextButton(
              onPressed: () => Get.offAllNamed("/"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: Text("Daftar"),
            ),
            const SizedBox(height: 10),
            const Text("Masuk dengan:"),
            IconButton(
              onPressed: () {},
              icon: Image.network(
                "http://pngimg.com/uploads/google/google_PNG19635.png",
                width: 50,
                height: 50
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}