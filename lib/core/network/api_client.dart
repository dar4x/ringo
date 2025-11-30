import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ringo/core/config/env.dart';

class ApiCleint {
  final http.Client _client = http.Client();

  Future<dynamic> get(String path, {Map<String, String>? params}) async {
    final uri = Uri.parse(Env.baseUrl + path).replace(queryParameters: params);
    final response = await _client.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception("Api error: ${response.statusCode}");
    }
  }

  Future<dynamic> postJson(String path, {Object? body}) async {
    final uri = Uri.parse(Env.baseUrl + path);
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return json.decode(response.body);
    } else {
      throw Exception("Api error: ${response.statusCode}");
    }
  }
}
