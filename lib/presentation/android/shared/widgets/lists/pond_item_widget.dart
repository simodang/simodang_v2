import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PondItemWidget extends StatelessWidget {
  PondItemWidget({
    super.key, 
    required this.title,
    required this.address,
    required this.imageUrl,
  });

  final String title;
  final String address;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/detail"),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, fit: BoxFit.fitWidth, width: 150, height: 100),
            const SizedBox(height: 14),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  const SizedBox(height: 5),
                  Text(address),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}