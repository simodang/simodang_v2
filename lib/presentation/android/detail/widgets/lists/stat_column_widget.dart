import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/detail/widgets/icon_stat_widget.dart';

class StatColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconStatWidget(
          label: "Suhu",
          value: "29 °C",
          icon: Icons.thermostat,
          color: Colors.blue,
          softColor: Colors.blue[100]!,
        ),
        const SizedBox(height: 16),
        IconStatWidget(
          label: "pH",
          value: "2",
          icon: Icons.local_drink,
          color: Colors.orange,
          softColor: Colors.orange[100]!,
        ),
        const SizedBox(height: 16),
        IconStatWidget(
          label: "TDO",
          value: "29 mg/L",
          icon: Icons.air,
          color: Colors.green,
          softColor: Colors.green[100]!,
        ),
        const SizedBox(height: 16),
        IconStatWidget(
          label: "TDS",
          value: "29 ppm",
          icon: Icons.dew_point,
          color: Colors.brown,
          softColor: Colors.brown[100]!,
        ),
        const SizedBox(height: 16),
        IconStatWidget(
          label: "Turbiditas",
          value: "29 NTU",
          icon: Icons.water_damage,
          color: Colors.teal,
          softColor: Colors.teal[100]!,
        ),
      ],
    );
  }
}