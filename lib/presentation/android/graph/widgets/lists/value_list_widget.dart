import 'package:flutter/material.dart';
import 'package:simodang_v2/application/data/models/metric.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/reversed_label_widget.dart';

class ValueListWidget extends StatelessWidget {
  const ValueListWidget({
    super.key,
    required this.metrics,
    required this.property,
    required this.isAveraged,
  });

  final List<Metric> metrics;
  final String property;
  final bool isAveraged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: metrics.length,
        separatorBuilder:(context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ReversedLabelWidget(
            label: isAveraged
              ? metrics[index].getDate()
              : metrics[index].getTime(),
            value: metrics[index].getMetric(property).toString(),
          );
        },
      ),
    );
  }
}
