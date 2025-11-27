// Internal packages
import 'package:ringo/domain/entities/song.dart';
import 'package:ringo/domain/repositories/song_repository.dart';

class SearchSongs {
  final SongRepository repository;

  SearchSongs(this.repository);

  Future<List<Song>> call(String query) {
    return repository.search(query);
  }
}
