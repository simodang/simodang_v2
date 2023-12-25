import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:simodang_v2/application/data/models/article.dart';
import 'package:simodang_v2/application/providers/networks/apis/article_api.dart';

class ArticleService {
  Future<List<Article>> getArticles() async {
    final response = await ArticleAPI().getArticles();
    final List<dynamic> articles = jsonDecode(response.body);
    
    return articles.map((e) => Article.fromJson(e)).toList();
  }
}
