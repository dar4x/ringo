import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String artistName;
  final String trackName;
  final String albumName;
  final VoidCallback cardPage;
  final int trackId;

  const CardWidget({
    super.key,
    required this.artistName,
    required this.trackName,
    required this.albumName,
    required this.cardPage,
    required this.trackId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cardPage,
      child: Container(
        width: 450,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  artistName,
                  style: const TextStyle(
                    color: Color(0xFF659df2),
                    fontSize: 24,
                    fontFamily: 'Spoof',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$albumName - ',
                  style: const TextStyle(
                    color: Color(0xFF70a4f3),
                    fontFamily: 'Spoof',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  artistName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 173, 174, 175),
                    fontFamily: 'Spoof',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
