import 'package:flutter/material.dart';
import 'package:simodang_v2/application/data/models/metric.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/reversed_label_widget.dart';

class ValueListWidget extends StatelessWidget {
  const ValueListWidget({
    super.key,
    required this.metrics,
    required this.property,
  });

  final List<Metric> metrics;
  final String property;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: metrics.length,
        separatorBuilder:(context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ReversedLabelWidget(
            label: metrics[index].getFullTime(),
            value: metrics[index].getMetric(property).toString(),
          );
        },
      ),
    );
  }
}
