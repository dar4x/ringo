// External packages
import 'dart:convert';
import 'package:http/http.dart' as http;

// Internal packages
import 'package:ringo/core/config/env.dart';

class ApiCleint {
  final http.Client client = http.Client();

  Future<http.Response> get(String path, {Map<String, String>? params}) async {
    final uri = Uri.parse(Env.baseUrl + path).replace(queryParameters: params);

    final response = await client.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception("Api error: ${response.statusCode}");
    }
  }
}
