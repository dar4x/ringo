// External packages
import 'package:flutter/material.dart';

// Internal packages
import 'package:ringo/core/network/api_client.dart';
import 'package:ringo/core/widgets/button.dart';
import 'package:ringo/core/widgets/header.dart';
import 'package:ringo/core/widgets/search.dart';
import 'package:ringo/data/datasources/song_remote_datasource.dart';
import 'package:ringo/data/repository/song_repository_impl.dart';
import 'package:ringo/domain/usecase/search_usecase.dart';
import 'package:ringo/presentation/viewmodels/search_viewmodel.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final SearchViewModel searchVM;

  @override
  void initState() {
    super.initState();

    // 1. Создаем API клиент
    final apiClient = ApiCleint();

    // 2. Передаем apiClient в DataSource
    final dataSource = SongRemoteDataSource(apiClient);

    // 3. Создаем репозиторий
    final repository = SongRepositoryImpl(dataSource);

    // 4. UseCase
    final searchUseCase = SearchSongs(repository);

    // 5. ViewModel
    searchVM = SearchViewModel(searchUseCase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          SizedBox(height: 160),

          // ✔️ Передаем уже созданный VM
          SearchWidget(vm: searchVM),

          Spacer(),

          AppButton(
            title: 'Upload File .txt',
            onPressed: () {},
            icon: Icons.upload,
          ),
          SizedBox(height: 10),
          AppButton(
            title: 'Upload File mp3',
            onPressed: () {},
            icon: Icons.upload,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
