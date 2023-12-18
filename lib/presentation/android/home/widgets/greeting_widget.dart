import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreetingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning👋"),
            Text("Kaedehara Kazuha",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )
            ,)
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () => Get.toNamed("/login"),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.grey[100]
          ),
          child: const Icon(Icons.notifications, color: Colors.black),
        )
      ],
    );
  }
}