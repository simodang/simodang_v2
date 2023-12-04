import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/pill_label_widget.dart';

class PillColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PillLabelWidget(
          label: "Kolam Terisi",
          value: "Ya",
          status: true,
        ),
        PillLabelWidget(
          label: "Status",
          value: "Buruk",
          status: false,
        ),
      ],
    );
  }
}