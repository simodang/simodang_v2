import 'package:flutter/material.dart';

class PillLabelWidget extends StatelessWidget {
  PillLabelWidget({
    super.key,
    required this.label,
    required this.value,
    required this.status,
  });

  final String label;
  final String value;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Chip(
          backgroundColor: status ? Colors.green[100] : Colors.red[100],
          label: Text(value),
        )
      ],
    );
  }
}