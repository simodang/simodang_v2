import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/home/home_controller.dart';
import 'package:simodang_v2/presentation/android/home/widgets/greeting_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/article_list_item_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/article_list_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/pond_list_item_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/lists/pond_list_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/stat_widget.dart';
import 'package:simodang_v2/presentation/android/home/widgets/title_button_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingWidget(),
          const SizedBox(height: 15),
          StatWidget(),
          TitleButtonWidget(title: "Kolam"),
          const PondListWidget(),
          TitleButtonWidget(title: "Artikel"),
          ArticleListWidget(),
        ],
      ),
      )
    );
  }
}