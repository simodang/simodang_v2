import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/home/home_controller.dart';
import 'package:simodang_v2/presentation/android/home/widgets/greeting_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/article_list_item_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/stat_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/title_button_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/lists/pond_item_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    super.key,
    required this.changePage,
  });

  final Function changePage;
  
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
            Obx(() => GreetingWidget(
              greeting: controller.greeting.value,
            )),
            const SizedBox(height: 15),
            Obx(() => StatWidget(
              pondCount: controller.pondState.ponds.length,
              seedCount: controller.seedCount.value,
              warningCount: controller.warningCount.value,
            )),
            TitleButtonWidget(
              title: "Kolam",
              onPressed: () {
                changePage();
              },
            ),
            SizedBox(
              height: 200,
              child: Obx(() => controller.pondState.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.pondState.getLastFive().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: PondItemWidget(
                      title: controller.pondState.ponds[index].name,
                      address: controller.pondState.ponds[index].city,
                      imageUrl: controller.pondState.ponds[index].imageUrl,
                      onTap: () => Get.toNamed('/detail?id=${controller.pondState.ponds[index].id}'),
                    ),
                  );
                }
              ))
            ),
            TitleButtonWidget(
              title: "Artikel",
              onPressed: () {},
            ),
            Flexible(
              child: Obx(() => ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => {},
                    child: ArticleListItemWidget(
                      imageUrl: controller.articles[index].image,
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