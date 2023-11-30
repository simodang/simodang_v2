import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/home/widgets/stat_box_widget.dart';

class StatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      StatBoxWidget(title: "Kolam", value: 10),
      SizedBox(width: 15),
      StatBoxWidget(title: "Bibit", value: 500),
      SizedBox(width: 15),
      StatBoxWidget(title: "Peringatan", value: 3),
    ]);
  }
}
