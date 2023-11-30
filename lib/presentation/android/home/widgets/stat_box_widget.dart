import 'package:flutter/material.dart';

class StatBoxWidget extends StatelessWidget {
  const StatBoxWidget({
    super.key, 
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
              ),
            ],
          ),
        ),
      );
  }
}