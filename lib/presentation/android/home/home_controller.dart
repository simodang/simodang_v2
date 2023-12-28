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

  @override
  void onInit() {
    super.onInit();
    getArticles();
    getPonds().then((value) {
      setSeedCount();
      setWarningCount();
    });
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
}