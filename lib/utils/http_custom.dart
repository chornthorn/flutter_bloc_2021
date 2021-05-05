import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class MobileHttpClient {
  Future<dynamic> get({String path, String token});
  Future<dynamic> post(
      {String path, String body, String token, Map<String, String> header});
  Future<dynamic> put({String path, String body, String token});
  Future<dynamic> delete({String path, String token});
}

class CustomHttp implements MobileHttpClient {
  _header(String token) {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return headers;
  }

  _response(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  http.Response response;

  @override
  Future delete({String path, String token}) async {
    response = await http.delete(path, headers: _header(token));
    return _response(response);
  }

  @override
  Future get({String path, String token}) async {
    response = await http.get(path, headers: _header(token));
    return _response(response);
  }

  @override
  Future post({
    String path,
    String body,
    String token,
    Map<String, String> header,
  }) async {
    response = await http.post(path, body: body, headers: header);
    return _response(response);
  }

  @override
  Future put({String path, String body, String token}) async {
    response = await http.put(path, body: body, headers: _header(token));
    return _response(response);
  }
}
