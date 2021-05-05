import 'dart:convert';

import 'package:flutter_bloc_2021/data/models/user_model.dart';
import 'package:flutter_bloc_2021/utils/http_custom.dart';
import 'package:http/http.dart' as http;

class UserService {
  final CustomHttp _customHttp = new CustomHttp();
  final _urlPath =
      "https://my-json-server.typicode.com/chornthorn/json-demo/users";
  // Future<List<UserModel>> getUserList() async {
  //   final response = await _customHttp.get(path: _urlPath);
  //   var result = jsonDecode(response.body) as List;
  //   return result.map((data) => new UserModel.fromJson(data)).toList();
  // }

  Future<List<UserModel>> getUserList() async {
    final response = await http.get(_urlPath);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List;
      return result.map((data) => new UserModel.fromJson(data)).toList();
    } else {
      throw Exception("Unable to get post list");
    }
  }
}
