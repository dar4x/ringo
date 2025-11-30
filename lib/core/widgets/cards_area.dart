import 'package:flutter/material.dart';
import 'package:ringo/core/themes/app_theme.dart';
import 'package:ringo/core/widgets/card.dart';
// import 'package:ringo/core/widgets/search_field.dart';
import 'package:ringo/presentation/pages/detail_page.dart';
import 'package:ringo/presentation/pages/search_page.dart';
import 'package:ringo/presentation/viewmodels/search_viewmodel.dart';

class CardsConcaveArea extends StatelessWidget {
  final SearchViewModel vm;

  const CardsConcaveArea({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: vm,
      builder: (_, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              decoration: AppTheme.innerNeumorphic(radius: 28),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  SearchFieldWrapper(vm: vm),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
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
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
