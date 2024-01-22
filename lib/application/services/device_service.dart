import 'dart:convert';
import 'dart:developer';

import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/application/providers/networks/apis/device_api.dart';

class DeviceService {
  Future<Device> getDevice(String deviceId) async {
    final response = await DeviceAPI().getDevice(deviceId);
    final Map<String, dynamic> device = jsonDecode(response.body);

    return Device.fromJson(device);
  }

  Future<void> updateDeviceByPond(String pondId, Device device) async {
    final body = device.toJson();
    await DeviceAPI().updateDeviceByPond(pondId, jsonEncode(body));
  }
}