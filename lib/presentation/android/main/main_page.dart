import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/home/home_page.dart';
import 'package:simodang_v2/presentation/android/main/main_controller.dart';
import 'package:simodang_v2/presentation/android/monitor/monitor_page.dart';
import 'package:simodang_v2/presentation/android/profile/profile_page.dart';

class MainPage extends GetView<MainController> {
  // static final List<Widget> _pages = <Widget>[
  //   HomePage(),
  //   MonitorPage(),
  //   ProfilePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());

    final List<Widget> pages = <Widget>[
    HomePage(
      changePage: () => controller.changeIndex(1),
    ),
    MonitorPage(),
    ProfilePage(),
  ];

    return Scaffold(
      body: Center(
        child: Obx(() => pages.elementAt(controller.currentIndex.value)),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor),
            label: "Monitor"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil"
          ),
        ],
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
      )),
    );
  }
}