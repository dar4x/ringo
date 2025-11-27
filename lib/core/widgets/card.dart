// External packages
import 'package:flutter/material.dart';

// Internal packages
import 'package:ringo/domain/entities/song.dart';

class CardItem extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;

  const CardItem({
    super.key,
    required this.song,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 450,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.trackName,
                style: const TextStyle(fontSize: 22, color: Colors.black)),
            Text("${song.albumName} - ${song.artistName}"),
          ],
        ),
      ),
    );
  }
}
