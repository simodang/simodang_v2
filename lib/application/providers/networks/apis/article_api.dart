import 'package:http/http.dart' as http;

import 'package:simodang_v2/application/providers/networks/api_endpoint.dart';

class ArticleAPI {
  Future<http.Response> getArticles() async {
    final response = await http.get(Uri.parse('${APIEndpoint.api}/articles'));

    if (response.statusCode != 200) throw Exception('Failed to load articles');

    return response;
  }
}
