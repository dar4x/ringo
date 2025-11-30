import 'package:ringo/data/datasources/song_remote_datasource.dart';
import 'package:ringo/domain/entities/song.dart';
import 'package:ringo/domain/repositories/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDataSource remote;

  SongRepositoryImpl(this.remote);

  @override
  Future<List<Song>> search(String query) async {
    final models = await remote.search(query);
    return models.map((m) => m.toEntityForSearch()).toList();
  }

  @override
  Future<Song> getSongById(int id) async {
    final model = await remote.getSongById(id);
    return model.toEntityForDetail();
  }
}
