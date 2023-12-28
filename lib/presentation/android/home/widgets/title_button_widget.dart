import 'package:flutter/material.dart';

class TitleButtonWidget extends StatelessWidget {
  TitleButtonWidget({
    super.key, 
    required this.title,
    required this.onPressed
  });

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: const Text(
            "Lihat Semua",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )
          ),
        )
      ],
    );
  }
}
