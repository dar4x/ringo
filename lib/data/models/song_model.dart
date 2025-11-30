import 'package:ringo/domain/entities/song.dart';

class SongModel {
  final int id;
  final String trackName;
  final String artistName;
  final String albumName;
  final String? plainLyrics;

  SongModel({
    required this.id,
    required this.trackName,
    required this.artistName,
    required this.albumName,
    this.plainLyrics,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'] ?? 0,
      trackName: json['trackName'] ?? '',
      artistName: json['artistName'] ?? '',
      albumName: json['albumName'] ?? '',
      plainLyrics: json['plainLyrics'], // оставляем nullable
    );
  }

  /// Для поиска — plainLyrics не нужен
  Song toEntityForSearch() {
    return Song(
      id: id,
      trackName: trackName,
      artistName: artistName,
      albumName: albumName,
      plainLyrics: '', // пусто, потому что при поиске нет текста
    );
  }

  /// Для детальной страницы — plainLyrics учитываем
  Song toEntityForDetail() {
    return Song(
      id: id,
      trackName: trackName,
      artistName: artistName,
      albumName: albumName,
      plainLyrics: plainLyrics ?? '', // если null, ставим пустую строку
    );
  }
}
