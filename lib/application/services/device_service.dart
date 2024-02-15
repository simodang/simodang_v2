import 'dart:convert';

import 'package:simodang_v2/application/data/models/device.dart';
import 'package:simodang_v2/application/providers/networks/apis/device_api.dart';

class DeviceService {
  Future<Device> getDevice(String deviceId) async {
    final response = await DeviceAPI().getDevice(deviceId);
    final Map<String, dynamic> device = jsonDecode(response.body);

    return Device.fromJson(device);
  }

  Future<List<Device> > getDevices() async {
    final response = await DeviceAPI().getDevices();
    final List<dynamic> devices = jsonDecode(response.body);
    
    return devices.map((e) => Device.fromJson(e)).toList();
  }

  Future<void> updateDeviceByPond(String pondId, Device device) async {
    final body = device.toJson();
    await DeviceAPI().updateDeviceByPond(pondId, jsonEncode(body));
  }
}