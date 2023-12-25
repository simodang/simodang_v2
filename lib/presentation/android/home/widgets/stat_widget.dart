import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/home/widgets/stat_box_widget.dart';

class StatWidget extends StatelessWidget {
  const StatWidget({
    super.key,
    required this.pondCount,
  });

  final int pondCount;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StatBoxWidget(title: "Kolam", value: pondCount),
      SizedBox(width: 15),
      StatBoxWidget(title: "Bibit", value: 500),
      SizedBox(width: 15),
      StatBoxWidget(title: "Peringatan", value: 3),
    ]);
  }
}
