import 'package:flutter/material.dart';
import 'package:ringo/core/network/api_client.dart';
import 'package:ringo/core/themes/app_theme.dart';
import 'package:ringo/core/widgets/button.dart';
import 'package:ringo/core/widgets/cards_area.dart';
import 'package:ringo/core/widgets/header.dart';
import 'package:ringo/data/datasources/song_remote_datasource.dart';
import 'package:ringo/data/repository/song_repository_impl.dart';
import 'package:ringo/domain/usecase/search_usecase.dart';
import 'package:ringo/presentation/viewmodels/search_viewmodel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final SearchViewModel searchVM;
  String lastQuery = "";

  @override
  void initState() {
    super.initState();
    final apiClient = ApiCleint();
    final dataSource = SongRemoteDataSource(apiClient);
    final repository = SongRepositoryImpl(dataSource);
    final searchUseCase = SearchSongs(repository);
    searchVM = SearchViewModel(searchUseCase);
  }

  Future<void> _onSearch(String query) async {
    setState(() {
      lastQuery = query;
    });
    await searchVM.search(query);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double topSpace = 120;
    final double bottomButtonsHeight = 65 + 10 + 65 + 20;
    final double concaveHeight =
        size.height - topSpace - bottomButtonsHeight - 40;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 40),

            // Подпись над инпутом
            Text(
              "Search the artist or song",
              style: AppTheme.body.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 12),

            // Инпут поиска

            // Строка "Search for: Result" после первого поиска
            if (lastQuery.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Search for: $lastQuery",
                    style: AppTheme.body.copyWith(color: Colors.white70),
                  ),
                ),
              ),
            if (lastQuery.isNotEmpty) const SizedBox(height: 8),

            SizedBox(
              height: concaveHeight.clamp(220, size.height * 0.6),
              child: CardsConcaveArea(vm: searchVM),
            ),
            const SizedBox(height: 24),
            AppButton(
              title: 'Upload File .txt',
              onPressed: () {},
              icon: Icons.upload,
            ),
            const SizedBox(height: 10),
            AppButton(
              title: 'Upload File mp3',
              onPressed: () {},
              icon: Icons.upload,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
