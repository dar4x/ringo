import 'package:get_it/get_it.dart';
import 'package:ringo/core/network/api_client.dart';
import 'package:ringo/data/datasources/song_remote_datasource.dart';
import 'package:ringo/data/repository/song_repository_impl.dart';
import 'package:ringo/domain/repositories/song_repository.dart';
import 'package:ringo/domain/usecase/get_song_by_id.dart';

void setupDependencies() {
  final sl = GetIt.instance;

  // API клиент
  sl.registerLazySingleton<ApiCleint>(() => ApiCleint());

  // DataSource
  sl.registerLazySingleton<SongRemoteDataSource>(
      () => SongRemoteDataSource(sl()));

  // Репозиторий
  sl.registerLazySingleton<SongRepository>(() => SongRepositoryImpl(sl()));

  // UseCase
  sl.registerLazySingleton<GetSongById>(() => GetSongById(sl()));
}
