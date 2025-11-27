import 'package:ringo/data/datasources/song_remote_datasource.dart';
import 'package:ringo/data/models/song_model.dart';
import 'package:ringo/domain/repositories/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDataSource remote;

  SongRepositoryImpl(this.remote);

  @override
  Future<List<SongModel>> search(String query) {
    return remote.search(query);
  }
}
