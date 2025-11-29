// External packages
import 'package:flutter/material.dart';
import 'package:ringo/core/themes/app_theme.dart';

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
      animation: vm,
      builder: (context, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;
            final double horizontalPadding = maxWidth * 0.03;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding.clamp(10, 18),
                vertical: 10,
              ),
              child: Column(
                children: [
                  _SearchField(onSubmit: vm.search),
                  const SizedBox(height: 20),

                  // 🔥 Теперь это скролящиеся карточки
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: vm.results.length,
                      itemBuilder: (_, i) {
                        final song = vm.results[i];
                        return CardItem(
                          song: song,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(songId: song.id),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
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
