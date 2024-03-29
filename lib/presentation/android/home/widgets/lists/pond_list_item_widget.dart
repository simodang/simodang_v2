import 'package:flutter/material.dart';

class PondListItemWidget extends StatelessWidget {
  PondListItemWidget({
    super.key, 
    required this.title,
    required this.address,
  });

  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network("https://placehold.co/600x400/png", fit: BoxFit.cover),
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