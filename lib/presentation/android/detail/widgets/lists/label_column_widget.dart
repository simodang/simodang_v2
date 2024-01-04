import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';

class LabelColumnWidget extends StatelessWidget {
  const LabelColumnWidget({
    super.key,
    required this.seedDate,
    required this.seedCount,
  });

  final String seedDate;
  final int seedCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowLabelWidget(
          label: "Tanggal Bibit Masuk",
          value: DateFormat("dd MMMM yyyy").format(DateTime.parse(seedDate)),
        ),
        const SizedBox(height: 10),
        RowLabelWidget(
          label: "Jumlah Bibit",
          value: "$seedCount bibit",
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}