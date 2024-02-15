import 'package:http/http.dart' as http;
import 'package:simodang_v2/application/providers/networks/api_endpoint.dart';

class DeviceAPI {
  Future<http.Response> getDevice(String deviceId) async {
    final response = await http.get(Uri.parse(
      '${APIEndpoint.api}/iot/devices/$deviceId',
    ),
      headers: {'Authorization': 'Bearer ${APIEndpoint.token}'}
    );

    print(response.statusCode);

    if (response.statusCode != 200) throw Exception('Failed to load device');

    return response;
  }

  Future<http.Response> getDevices() async {
    final response = await http.get(Uri.parse(
      '${APIEndpoint.api}/devices',
    ),
      headers: {'Authorization': 'Bearer ${APIEndpoint.token}'}
    );

    if (response.statusCode != 200) throw Exception('Failed to load devices');

    return response;
  }

  Future<http.Response> updateDeviceByPond(String pondId, String body) async {
    final response = await http.patch(Uri.parse(
      '${APIEndpoint.api}/ponds/$pondId/device',
    ),
      headers: {
        'Authorization': 'Bearer ${APIEndpoint.token}',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode != 200) throw Exception('Failed to update device');

    return response;
  }
}
