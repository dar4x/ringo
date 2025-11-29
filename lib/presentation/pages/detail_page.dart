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
            }

            if (snap.hasError) {
              return Center(
                child: Text(
                  "Ошибка: ${snap.error}",
                  style: AppTheme.body.copyWith(color: Colors.redAccent),
                ),
              );
            }

            if (!snap.hasData) {
              return const Center(
                child: Text("Нет данных", style: AppTheme.body),
              );
            }

            final song = snap.data!;

            return SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double padding =
                      (constraints.maxWidth * 0.05).clamp(12, 20);

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔥 Заголовок + артист в одну строку
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                song.trackName,
                                style: AppTheme.title.copyWith(fontSize: 28),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              song.artistName,
                              style: AppTheme.subtitle.copyWith(fontSize: 18),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // 💿 Альбом
                        Text(
                          song.albumName,
                          style: AppTheme.body.copyWith(
                            color: Colors.white38,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // 📄 Lyrics — на весь экран
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: constraints.maxWidth,
                          decoration: AppTheme.cardStyle,
                          child: Text(
                            song.plainLyrics,
                            style: AppTheme.lyrics,
                          ),
                        ),

                        const SizedBox(height: 30),

                        Center(
                          child: SizedBox(
                            width: constraints.maxWidth * 0.6,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: AppTheme.buttonStyle,
                              child: const Text("Start Lesson"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
