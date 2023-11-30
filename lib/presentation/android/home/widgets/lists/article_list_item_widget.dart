import 'package:flutter/material.dart';

class ArticleListItemWidget extends StatelessWidget {
  const ArticleListItemWidget({
    super.key, 
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network("https://placehold.co/600x400/png", width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}