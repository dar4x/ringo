// External packages
import 'package:flutter/material.dart';

// Internal packages
import 'package:ringo/core/network/api_client.dart';
import 'package:ringo/core/themes/app_theme.dart';
import 'package:ringo/core/widgets/button.dart';
import 'package:ringo/core/widgets/cards_area.dart';
import 'package:ringo/core/widgets/header.dart';
import 'package:ringo/core/widgets/search_field.dart';
import 'package:ringo/data/datasources/song_remote_datasource.dart';
import 'package:ringo/data/repository/song_repository_impl.dart';
import 'package:ringo/domain/usecase/search_usecase.dart';
import 'package:ringo/presentation/viewmodels/search_viewmodel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchViewModel searchVM;

  @override
  void initState() {
    super.initState();
    final apiClient = ApiCleint();
    final dataSource = SongRemoteDataSource(apiClient);
    final repository = SongRepositoryImpl(dataSource);
    final searchUseCase = SearchSongs(repository);
    searchVM = SearchViewModel(searchUseCase);
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
            const SizedBox(height: 60),
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

class SearchFieldWrapper extends StatelessWidget {
  final SearchViewModel vm;

  const SearchFieldWrapper({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 450,
        child: SearchField(onSubmit: vm.search),
      ),
    );
  }
}
