import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/article.dart';
import 'package:simodang_v2/application/services/article_services.dart';

class HomeController extends GetxController {
  final articleService = ArticleService();
  RxList<Article> articles = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    getArticles();
  }

  void getArticles() async {
    final List<Article> articles = await articleService.getArticles();
    this.articles.value = articles;
  }
}