import 'dart:convert';

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

  Future<http.Response> getPond(String id) async {
    final response = await http.get(Uri.parse('${APIEndpoint.api}/ponds/$id'),
      headers: {'Authorization': 'Bearer ${APIEndpoint.token}'}
    );

    if (response.statusCode != 200) throw Exception('Failed to load pond');

    return response;
  }

  Future<http.Response> createPond(String body) async {
    final response = await http.post(Uri.parse('${APIEndpoint.api}/ponds'),
      headers: {
        'Authorization': 'Bearer ${APIEndpoint.token}',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    print((body));
    print(jsonDecode(response.body));

    if (response.statusCode != 201) throw Exception('Failed to create pond');

    return response;
  }
}
