import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ringo/domain/entities/song.dart';
import 'package:ringo/domain/usecase/get_song_by_id.dart';

class DetailPage extends StatelessWidget {
  final int songId;

  const DetailPage({super.key, required this.songId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Song>(
        future: GetIt.I<GetSongById>()(songId),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snap.hasError) {
            return Center(child: Text("Ошибка: ${snap.error}"));
          } else if (!snap.hasData) {
            return Center(child: Text("Нет данных"));
          }

          final song = snap.data!;
          return SingleChildScrollView(
            // если много текста
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.trackName,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(song.artistName, style: TextStyle(fontSize: 18)),
                Text(song.albumName, style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Text(song.plainLyrics, style: TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}
