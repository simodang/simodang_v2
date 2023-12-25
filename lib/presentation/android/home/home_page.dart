import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/home/home_controller.dart';
import 'package:simodang_v2/presentation/android/home/widgets/greeting_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/article_list_item_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/pond_list_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/stat_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/title_button_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/lists/pond_item_widget.dart';

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
            Obx(() => StatWidget(
              pondCount: controller.ponds.length,
            )),
            TitleButtonWidget(title: "Kolam"),
            SizedBox(
              height: 200,
              child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.ponds.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: PondItemWidget(
                      title: controller.ponds[index].name,
                      address: controller.ponds[index].city,
                    ),
                  );
                }
              ))
            ),
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