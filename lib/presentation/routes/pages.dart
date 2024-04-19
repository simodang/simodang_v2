import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/add_pond/add_pond_page.dart';
import 'package:simodang_v2/presentation/android/date_picker/date_picker_page.dart';
import 'package:simodang_v2/presentation/android/detail/detail_page.dart';
import 'package:simodang_v2/presentation/android/edit_device/edit_device_page.dart';
import 'package:simodang_v2/presentation/android/edit_field/edit_field_page.dart';
import 'package:simodang_v2/presentation/android/edit_pond/edit_pond_page.dart';
import 'package:simodang_v2/presentation/android/edit_threshold/edit_threshold_page.dart';
import 'package:simodang_v2/presentation/android/graph/graph_page.dart';
import 'package:simodang_v2/presentation/android/login/login_page.dart';
import 'package:simodang_v2/presentation/android/main/main_page.dart';
import 'package:simodang_v2/presentation/android/notification/notification_page.dart';
import 'package:simodang_v2/presentation/android/qr_scan/qr_scan_page.dart';
import 'package:simodang_v2/presentation/android/select_device/select_device_binding.dart';
import 'package:simodang_v2/presentation/android/select_device/select_device_page.dart';
part './routes.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.initial, page: () => MainPage()),
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.detail, page: () => DetailPage()),
    GetPage(name: Routes.graph, page: () => GraphPage()),
    GetPage(name: Routes.datepicker, page: () => DatePickerPage()),
    GetPage(name: Routes.addPond, page: () => AddPondPage()),
    GetPage(name: Routes.editPond, page: () => EditPondPage()),
    GetPage(name: Routes.editField, page: () => EditFieldPage()),
    GetPage(
      name: Routes.selectDevice,
      page: () => SelectDevicePage(),
      binding: SelectDeviceBinding(),
    ),
    GetPage(name: Routes.editDevice, page: () => EditDevicePage()),
    GetPage(name: Routes.editThreshold, page: () => EditThresholdPage()),
    GetPage(name: Routes.qr, page: () => QrScanPage()),
    GetPage(name: Routes.notif, page: () => NotificationPage()),
  ];
}