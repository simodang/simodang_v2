import 'package:flutter/material.dart';

class TitleButtonWidget extends StatelessWidget {
  TitleButtonWidget({
    super.key, 
    required this.title,
    required this.buttonText,
    required this.onPressed,
    required this.disabled,
  });

  final String title;
  final String buttonText;
  final Function onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        const Spacer(),
        TextButton(
          onPressed: disabled ? null : () => onPressed(),
          child: Text(
            buttonText,
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