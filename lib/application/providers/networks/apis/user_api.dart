import 'package:http/http.dart' as http;

import 'package:simodang_v2/application/providers/networks/api_endpoint.dart';

class UserAPI {
  Future<http.Response> getProfile() async {
    final response = await http.get(Uri.parse('${APIEndpoint.api}/users/profile'),
      headers: {'Authorization': 'Bearer ${APIEndpoint.token}'}
    );

    if (response.statusCode != 200) throw Exception('Failed to load profile');

    return response;
  }
}