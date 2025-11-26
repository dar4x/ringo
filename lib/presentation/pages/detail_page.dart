import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int trackId;
  final String artistName;
  final String trackName;

  const DetailPage(
      {super.key,
      required this.trackId,
      required this.artistName,
      required this.trackName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Text('$artistName - '),
          const SizedBox(width: 5),
          Text(trackName)
        ],
      ),
    );
  }
}
