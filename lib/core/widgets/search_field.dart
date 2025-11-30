import 'package:flutter/material.dart';
import 'package:ringo/core/themes/app_theme.dart';

class SearchField extends StatelessWidget {
  final Function(String) onSubmit;

  const SearchField({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      decoration: AppTheme.neumorphic(),
      child: TextField(
        style: const TextStyle(color: Colors.white, fontFamily: 'Spoof'),
        decoration: InputDecoration(
          hintText: "Search song",
          prefixIcon: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppTheme.midnightLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search, color: Colors.white70),
          ),
        ),
        onSubmitted: onSubmit,
      ),
    );
  }
}
