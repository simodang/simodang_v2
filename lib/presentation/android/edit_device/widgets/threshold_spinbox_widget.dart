import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/subtitle_widget.dart';

class ThresholdSpinboxWidget extends StatelessWidget {
  ThresholdSpinboxWidget({
    super.key,
    required this.parameter,
    required this.max,
    required this.currentMin,
    required this.currentMax,
    required this.onChangedMin,
    required this.onChangedMax,
    required this.onPressed,
  });

  final String parameter;
  final int max;
  final int currentMin;
  final int currentMax;
  final Function onChangedMin;
  final Function onChangedMax;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SubtitleWidget(text: "Batas $parameter"),
            Spacer(),
            TextButton(
              onPressed: () => onPressed(),
              child: const Text("Simpan"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SpinBox(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Batas Atas $parameter',
          ),
          min: 0,
          max: max.toDouble(),
          value: currentMax.toDouble(),
          onChanged: (value) {
            onChangedMax(value.toInt());
          },
        ),
        const SizedBox(height: 20),
        SpinBox(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Batas Bawah $parameter',
          ),
          min: 0,
          max: max.toDouble(),
          value: currentMin.toDouble(),
          onChanged: (value) {
            onChangedMin(value.toInt());
          },
        ),
      ],
    );
  }
}