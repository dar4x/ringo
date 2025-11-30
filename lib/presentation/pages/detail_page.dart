import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ringo/core/themes/app_theme.dart';
import 'package:ringo/domain/entities/song.dart';
import 'package:ringo/domain/usecase/get_song_by_id.dart';
import 'package:ringo/presentation/pages/lesson_page.dart';

class DetailPage extends StatelessWidget {
  final int songId;

  const DetailPage({super.key, required this.songId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Song Detail",
          style: AppTheme.title.copyWith(fontSize: 22),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
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
                        Text(
                          song.albumName,
                          style: AppTheme.body.copyWith(
                            color: Colors.white38,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 25),
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
                              child: const Text("Start Lesson"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LessonPage(songId: song.id),
                                  ),
                                );
                              },
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
