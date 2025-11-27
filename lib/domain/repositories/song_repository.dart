// Internal packages
import 'package:ringo/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> search(String query);
  Future<Song> getSongById(int id);
}
