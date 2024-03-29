import 'package:http/http.dart' as http;
import 'package:simodang_v2/application/providers/networks/api_endpoint.dart';

class MetricAPI {
  Future<http.Response> getMetrics(
    String pondId,
    String timeString,
    int hours
  ) async {
    final response = await http.get(Uri.parse(
      '${APIEndpoint.api}/metrics/$pondId?timeString=$timeString&hours=$hours'
    ),
      headers: {'Authorization': 'Bearer ${APIEndpoint.token}'}
    );

    if (response.statusCode != 200) throw Exception('Failed to load metrics');

    return response;
  }

  Future<http.Response> getAverageMetrics(
    String pondId,
    String startDate,
    String endDate,
  ) async {
    final response = await http.get(Uri.parse(
      '${APIEndpoint.api}/metrics/avg/$pondId?startDate=$startDate&endDate=$endDate'
    ),
      headers: {'Authorization': 'Bearer ${APIEndpoint.token}'}
    );

    print("api called");

    if (response.statusCode != 200) throw Exception('Failed to load metrics');

    return response;
  }
}
