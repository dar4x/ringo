import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ringo/core/config/env.dart';

class ApiCleint {
  final http.Client _client = http.Client();

  Future<dynamic> get(String path, {Map<String, String>? params}) async {
    final uri = Uri.parse(Env.baseUrl + path).replace(queryParameters: params);
    final response = await _client.get(uri);

    // Лог сырого тела (как есть, может быть "кракозябры")
    print('GET $uri');
    print(
      'RAW BODY: ${response.body.substring(0, response.body.length.clamp(0, 200))}',
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // ВАЖНО: декодируем байты как UTF‑8
      final utf8Body = utf8.decode(response.bodyBytes);
      final decoded = json.decode(utf8Body);

      // Лог уже нормальных данных
      if (decoded is List && decoded.isNotEmpty) {
        print('FIRST TRACK: ${decoded.first['trackName']}');
      }
      print('DECODED TYPE: ${decoded.runtimeType}');

      return decoded;
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
      final utf8Body = utf8.decode(response.bodyBytes);
      return json.decode(utf8Body);
    } else {
      throw Exception("Api error: ${response.statusCode}");
    }
  }
}
