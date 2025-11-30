import 'package:ringo/core/network/api_client.dart';
import 'package:ringo/data/models/song_model.dart';

class SongRemoteDataSource {
  final ApiCleint client;

  SongRemoteDataSource(this.client);

  Future<List<SongModel>> search(String query) async {
    final data = await client.get('song/search', params: {'q': query});
    return (data as List<dynamic>)
        .map((item) => SongModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<SongModel> getSongById(int id) async {
    final data = await client.get('song/detail?id=$id');
    return SongModel.fromJson(data as Map<String, dynamic>);
  }
}
