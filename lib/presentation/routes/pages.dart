import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/date_picker/date_picker_page.dart';
import 'package:simodang_v2/presentation/android/detail/detail_page.dart';
import 'package:simodang_v2/presentation/android/graph/graph_page.dart';
import 'package:simodang_v2/presentation/android/main/main_page.dart';
part './routes.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.initial, page: () => MainPage()),
    GetPage(name: Routes.detail, page: () => DetailPage()),
    GetPage(name: Routes.graph, page: () => GraphPage()),
    GetPage(name: Routes.datepicker, page: () => DatePickerPage()),
  ];
}