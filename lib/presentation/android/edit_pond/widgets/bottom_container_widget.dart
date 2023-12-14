import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/subtitle_widget.dart';

class BottomContainerWidget extends StatelessWidget {
  const BottomContainerWidget({
    super.key,
    required this.text,
    required this.initialValue,
    required this.setFinal,
    required this.setTemp,
    this.numberOnly
  });

  final String text;
  final String initialValue;
  final Function setFinal;
  final Function setTemp;
  final bool? numberOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SubtitleWidget(text: text),
              const Spacer(),
              TextButton(
                onPressed: () => {
                  Get.key.currentState?.pop(),
                  setFinal()
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: numberOnly == true ? TextInputType.number : TextInputType.text,
            initialValue: initialValue,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: text,
            ),
            onChanged: (value) => setTemp(value),
          ),
        ],
      ),
    );
  }
}