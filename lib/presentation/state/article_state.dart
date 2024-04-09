import 'package:get/get.dart';
import 'package:simodang_v2/application/data/models/article.dart';
import 'package:simodang_v2/application/services/article_services.dart';

class ArticleState extends GetxController {
  RxList<Article> articles = <Article>[].obs;
  final articleService = ArticleService();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getArticles();
  }

  void getArticles() async {
    try {
      isLoading(true);
      final articlesData = await articleService.getArticles();
      articles.assignAll(articlesData);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void refreshArticles() {
    getArticles();
  }
}