import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> searchSong(String query) async {
  final uri = Uri.parse('http://127.0.0.1:8000/song?q=$query');

  final response = await http.get(uri);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    print('Decoded JSON: $jsonBody');

    if (jsonBody["success"] == true) {
      final data = jsonBody["data"];
      print('Data field: $data');

      // Флаттим список, оставляем только Map
      final List<Map<String, dynamic>> flatList = [];
      for (var item in data) {
        print('Item: $item');
        if (item is Map<String, dynamic>) {
          flatList.add(item);
        } else if (item is List &&
            item.isNotEmpty &&
            item[0] is Map<String, dynamic>) {
          flatList.add(item[0]);
        }
      }
      print('FlatList: $flatList');

      return flatList;
    } else {
      throw Exception(jsonBody["error"] ?? "Unknown error from backend");
    }
  } else {
    throw Exception('Failed to load songs, status: ${response.statusCode}');
  }
}
