import 'package:http/http.dart' as http;

import 'package:simodang_v2/application/providers/networks/api_endpoint.dart';

class PondAPI {
  Future<http.Response> getPonds() async {
    final response = await http.get(Uri.parse('${APIEndpoint.api}/ponds'),
      headers: {'Authorization': 'Bearer ${APIEndpoint.token}'}
    );

    if (response.statusCode != 200) throw Exception('Failed to load ponds');

    return response;
  }
}
