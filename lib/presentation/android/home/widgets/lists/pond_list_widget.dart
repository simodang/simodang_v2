import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/pond_list_item_widget.dart';

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
          child: PondListItemWidget(
            title: "Kolam Coba",
            address: "Klojen, Malang"
          ),
        )
      ),
    );
  }
}