import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/article_list_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => null,
            child: const ArticleListItemWidget(
              title: "Scarlet Leaves Pursue Wild Waves Leaves in the Wind"
            )
          );
        },
        separatorBuilder:(context, index) => const SizedBox(height: 5),
      )
    );
  }
}