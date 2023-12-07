import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/reversed_label_widget.dart';

class ValueListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 19,
        separatorBuilder:(context, index) => const Divider(),
        itemBuilder: (context, index) => ReversedLabelWidget(
          label: "05/12/2021 10:33",
          value: "7 pH",
        ),
      ),
    );
  }
}
