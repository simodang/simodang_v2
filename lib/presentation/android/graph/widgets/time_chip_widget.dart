import 'package:flutter/material.dart';

class TimeChip extends StatelessWidget {
  TimeChip({
    super.key,
    required this.timeList,
    required this.currentIndex,
    required this.onSelected,
  });

  final List<String> timeList;
  final int currentIndex;
  final Function onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: timeList.map((time) {
        return ChoiceChip(
          label: Text(time),
          selected: currentIndex == timeList.indexOf(time),
          onSelected: (selected) {
            onSelected(timeList.indexOf(time));
          },
        );
      }).toList(),
    );
  }
}
