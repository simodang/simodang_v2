import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/main/main_page.dart';
part './routes.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.initial, page: () => MainPage())
  ];
}