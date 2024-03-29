import 'package:flutter/material.dart';

class IconLabelWidget extends StatelessWidget {
  IconLabelWidget({
    required this.label,
    required this.value,
    required this.description,
    required this.icon,
    required this.color,
    required this.softColor,
  });

  final String label;
  final String value;
  final String description;
  final IconData icon;
  final Color color;
  final Color softColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 48,
            height: 48,
            color: softColor,
            child: Icon(
              icon,
              size: 24,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        )
          ],
        ),
        const Spacer(),
        Text(description),
      ],
    );
  }
}