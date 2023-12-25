import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/home/home_controller.dart';
import 'package:simodang_v2/presentation/android/home/widgets/greeting_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/article_list_item_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/pond_list_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/stat_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/title_button_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          20, // left
          60, // top
          20, // right
          20, // bottom
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingWidget(),
            const SizedBox(height: 15),
            StatWidget(),
            TitleButtonWidget(title: "Kolam"),
            const PondListWidget(),
            TitleButtonWidget(title: "Artikel"),
            Flexible(
              child: Obx(() => ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => null,
                    child: ArticleListItemWidget(
                      title: controller.articles[index].title,
                    )
                  );
                },
                separatorBuilder:(context, index) => const SizedBox(height: 5),
              ))
            )
          ],
        ),
      )
    );
  }
}