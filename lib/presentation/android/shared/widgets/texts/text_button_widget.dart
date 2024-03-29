import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key, 
    required this.text,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String text;
  final String buttonLabel;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          )
        ),
        const Spacer(),
        TextButton(
          onPressed: () => onPressed(),
          child: Text(
            buttonLabel,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )
          ),
        )
      ],
    );
  }
}
