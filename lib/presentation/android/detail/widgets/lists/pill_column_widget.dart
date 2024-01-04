import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/pill_label_widget.dart';

class PillColumnWidget extends StatelessWidget {
  const PillColumnWidget({
    super.key,
    required this.isFilled,
    required this.status,
  });

  final bool isFilled;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PillLabelWidget(
          label: "Kolam Terisi",
          value: isFilled ? "Ya" : "Tidak",
          status: isFilled,
        ),
        PillLabelWidget(
          label: "Status",
          value:  status ? "Baik" : "Buruk",
          status: status,
        ),
      ],
    );
  }
}