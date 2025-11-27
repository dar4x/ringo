// External packages
import 'package:flutter/material.dart';

// Internal packages
import 'package:ringo/core/widgets/card.dart';
import 'package:ringo/presentation/pages/detail_page.dart';
import 'package:ringo/presentation/viewmodels/search_viewmodel.dart';

class SearchWidget extends StatelessWidget {
  final SearchViewModel vm;

  const SearchWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: vm, // подписка на notifyListeners
      builder: (context, _) {
        return Column(
          children: [
            _SearchField(onSubmit: vm.search),
            const SizedBox(height: 20),
            ...vm.results.map(
              (song) => CardItem(
                song: song,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(songId: song.id),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  final Function(String) onSubmit;

  const _SearchField({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: "Search song"),
      onSubmitted: onSubmit,
    );
  }
}
