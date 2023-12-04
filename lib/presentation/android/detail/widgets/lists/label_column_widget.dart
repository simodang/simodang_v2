import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';

class LabelColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowLabelWidget(
          label: "Tanggal Bibit Masuk",
          value: "21 Desember 2012",
        ),
        const SizedBox(height: 10),
        RowLabelWidget(
          label: "Jumlah Bibit",
          value: "177 Bibit",
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}