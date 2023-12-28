import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/home/widgets/stat_box_widget.dart';

class StatWidget extends StatelessWidget {
  const StatWidget({
    super.key,
    required this.pondCount,
    required this.seedCount,
    required this.warningCount,
  });

  final int pondCount;
  final int seedCount;
  final int warningCount;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StatBoxWidget(title: "Kolam", value: pondCount),
      const SizedBox(width: 15),
      StatBoxWidget(title: "Bibit", value: seedCount),
      const SizedBox(width: 15),
      StatBoxWidget(title: "Peringatan", value: warningCount),
    ]);
  }
}
