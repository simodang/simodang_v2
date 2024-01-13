import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:simodang_v2/application/data/models/metric.dart';


class CurrentValueWidget extends StatelessWidget {
  const CurrentValueWidget({
    super.key,
    required this.lastMetric,
    required this.property,
    required this.startDate,
    this.endDate,
  });

  final Metric lastMetric;
  final String property;
  final DateTime startDate;
  final DateTime? endDate;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              lastMetric.getMetric(property).toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              lastMetric.getUnit(property),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
            ),
          ],
        ),
        Text(
          formatDate(startDate, [dd, ' ', MM, ' ', yyyy]),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.grey
          ),
        ),
      ],
    );
  }
}