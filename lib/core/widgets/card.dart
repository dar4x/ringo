// External packages
import 'package:flutter/material.dart';
import 'package:ringo/core/themes/app_theme.dart';

// Internal packages
import 'package:ringo/domain/entities/song.dart';

class CardItem extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;

  const CardItem({super.key, required this.song, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: AppTheme.cardStyle,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.trackName, style: AppTheme.title.copyWith(fontSize: 22)),
            const SizedBox(height: 4),
            Text("${song.albumName} — ${song.artistName}",
                style: AppTheme.subtitle.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
