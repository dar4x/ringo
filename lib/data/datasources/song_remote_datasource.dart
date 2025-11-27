import 'package:ringo/core/network/api_client.dart';
import 'package:ringo/core/network/endpoints.dart';
import 'package:ringo/data/models/song_model.dart';

class SongRemoteDataSource {
  final ApiCleint api;

  SongRemoteDataSource(this.api);

  Future<List<SongModel>> search(String query) async {
    final jsonList = await api.get(
      Endpoints.search,
      params: {'q': query},
    );

    return (jsonList as List).map((e) => SongModel.fromJson(e)).toList();
  }
}
