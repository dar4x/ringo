// Internal packages
// import 'package:ringo/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<dynamic>> search(String query);
}
