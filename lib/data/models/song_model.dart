// import 'package:ringo/domain/entities/song.dart';

class SongModel {
  final int id;
  final String trackName;
  final String artistName;
  final String albumName;

  SongModel({
    required this.id,
    required this.trackName,
    required this.artistName,
    required this.albumName,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      trackName: json['trackName'],
      artistName: json['artistName'],
      albumName: json['albumName'],
    );
  }
}
