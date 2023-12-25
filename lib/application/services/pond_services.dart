import 'dart:convert';

import 'package:simodang_v2/application/data/models/pond.dart';
import 'package:simodang_v2/application/providers/networks/apis/pond_api.dart';

class PondService {
  Future<List<Pond>> getPonds() async {
    final response = await PondAPI().getPonds();
    final List<dynamic> ponds = jsonDecode(response.body);
    
    return ponds.map((e) => Pond.fromJson(e)).toList();
  }
}
