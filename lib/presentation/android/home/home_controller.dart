import 'package:get/get.dart';
import 'package:simodang_v2/presentation/state/article_state.dart';
import 'package:simodang_v2/presentation/state/device_state.dart';
import 'package:simodang_v2/presentation/state/pond_state.dart';

class HomeController extends GetxController {
  final pondState = Get.put(PondState());
  final articleState = Get.put(ArticleState());

  RxInt seedCount = 0.obs;
  RxInt warningCount = 0.obs;

  RxString greeting = "".obs;

  @override
  void onInit() {
    super.onInit();
    setSeedCount();
    setWarningCount();

    setGreetingByTime(DateTime.now().hour);
  }

  void setSeedCount() {
    final seedCount = pondState
      .ponds
      .fold(0, (sum, pond) => sum + pond.seedCount);
    this.seedCount.value = seedCount;
  }

  void setWarningCount() {
    final warningCount = pondState
      .ponds
      .where((pond) => pond.status == false).length;
    this.warningCount.value = warningCount;
  }

  void setGreetingByTime(int hour) {
    if (hour >= 0 && hour < 12) {
      greeting.value = "Good Morning👋";
    } else if (hour >= 12 && hour < 15) {
      greeting.value = "Good Afternoon👋";
    } else if (hour >= 15 && hour < 18) {
      greeting.value = "Good Evening👋";
    } else {
      greeting.value = "Good Night👋";
    }
  }
}