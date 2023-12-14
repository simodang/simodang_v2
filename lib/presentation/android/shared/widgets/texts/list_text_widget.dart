import 'package:flutter/material.dart';

class ListTextWidget extends StatelessWidget {
  ListTextWidget({
    super.key,
    required this.text,
    this.horizontalPadding,
  });

  final String text;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
        vertical: 10
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.blue
        ),
      ),
    );
  }
}