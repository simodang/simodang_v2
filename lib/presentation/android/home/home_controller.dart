import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/article.dart';
import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/application/services/article_services.dart';
import 'package:simodang_v2/application/services/pond_services.dart';

class HomeController extends GetxController {
  final articleService = ArticleService();
  final pondService = PondService();
  RxList<Article> articles = <Article>[].obs;
  RxList<Pond> ponds = <Pond>[].obs;

  RxInt seedCount = 0.obs;
  RxInt warningCount = 0.obs;

  RxString greeting = "".obs;

  @override
  void onInit() {
    super.onInit();
    getArticles();
    getPonds().then((value) {
      setSeedCount();
      setWarningCount();
    });

    setGreetingByTime(DateTime.now().hour);
  }

  void getArticles() async {
    final List<Article> articles = await articleService.getArticles();
    this.articles.value = articles.take(5).toList();
  }

  Future<void> getPonds() async {
    final List<Pond> ponds = await pondService.getPonds();
    this.ponds.value = ponds.take(5).toList();
  }

  void setSeedCount() {
    final List<Pond> ponds = this.ponds.toList();
    final seedCount = ponds.fold(0, (sum, pond) => sum + pond.seedCount);
    this.seedCount.value = seedCount;
  }

  void setWarningCount() {
    final List<Pond> ponds = this.ponds.toList();
    final warningCount = ponds.where((pond) => pond.status == false).length;
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