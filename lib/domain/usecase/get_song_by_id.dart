// Internal packages
import 'package:ringo/domain/entities/song.dart';
import 'package:ringo/domain/repositories/song_repository.dart';

class GetSongById {
  final SongRepository repository;

  GetSongById(this.repository);

  Future<Song> call(int id) => repository.getSongById(id);
}
