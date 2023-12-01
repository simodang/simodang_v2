import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/lists/pond_item_widget.dart';

class PondGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 200,
        ),
        itemBuilder:(context, index) => Card(
          child: PondItemWidget(
            title: "Kolam Coba",
            address: "Klojen, Malang"
          )
        ),
      )
    );
  }
}