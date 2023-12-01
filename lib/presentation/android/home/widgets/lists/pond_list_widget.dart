import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/lists/pond_item_widget.dart';

class PondListWidget extends StatelessWidget {
  const PondListWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          child: PondItemWidget(
            title: "Kolam Coba",
            address: "Klojen, Malang"
          ),
        )
      ),
    );
  }
}