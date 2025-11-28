import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ringo/core/themes/app_theme.dart';
import 'package:ringo/domain/entities/song.dart';
import 'package:ringo/domain/usecase/get_song_by_id.dart';

class DetailPage extends StatelessWidget {
  final int songId;

  const DetailPage({super.key, required this.songId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: FutureBuilder<Song>(
          future: GetIt.I<GetSongById>()(songId),
          builder: (_, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (snap.hasError) {
              return Center(
                child: Text("Ошибка: ${snap.error}",
                    style: AppTheme.body.copyWith(color: Colors.redAccent)),
              );
            } else if (!snap.hasData) {
              return const Center(
                child: Text("Нет данных", style: AppTheme.body),
              );
            }

            final song = snap.data!;

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🎵 Название
                    Text(song.trackName, style: AppTheme.title),

                    const SizedBox(height: 6),

                    // 👤 Артист
                    Text(song.artistName, style: AppTheme.subtitle),

                    // 💿 Альбом
                    Text(song.albumName,
                        style: AppTheme.body.copyWith(color: Colors.white38)),

                    const SizedBox(height: 30),

                    // 📄 Lyrics card (по теме)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: AppTheme.cardStyle,
                      child: Text(song.plainLyrics, style: AppTheme.lyrics),
                    ),

                    const SizedBox(height: 30),

                    // 🔘 Start Lesson button
                    Center(
                      child: SizedBox(
                        width: 260,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: AppTheme.buttonStyle,
                          child: const Text("Start Lesson"),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
