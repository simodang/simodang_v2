import 'dart:convert';

import 'package:simodang_v2/application/data/models/user.dart';
import 'package:simodang_v2/application/providers/networks/apis/user_api.dart';

class UserService {
  Future<User> getUser() async {
    final response = await UserAPI().getProfile();
    final Map<String, dynamic> user = jsonDecode(response.body);
    
    return User.fromJson(user);
  }
}