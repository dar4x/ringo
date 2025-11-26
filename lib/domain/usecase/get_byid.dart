import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ringo/main.dart';

Future<List<Map<String, dynamic>>> searchSong(String trackId) async {
  final uri = Uri.parse('${BASE_URL}detail?=$trackId');

  final response = await http.get(uri);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);

    if (jsonBody is List) {
      return List<Map<String, dynamic>>.from(jsonBody);
    } else {
      throw Exception("Unexpected response format: not a list");
    }
  } else {
    throw Exception("Failed to load songs, status ${response.statusCode}");
  }
}
