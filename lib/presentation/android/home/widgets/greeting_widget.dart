import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
    required this.greeting,
  });

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(greeting),
            const Text("Kaedehara Kazuha",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )
            )
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () => Get.toNamed("/notif"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[100]
          ),
          child: const Icon(Icons.notifications, color: Colors.black),
        )
      ],
    );
  }
}