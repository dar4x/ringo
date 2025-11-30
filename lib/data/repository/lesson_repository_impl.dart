import 'package:ringo/data/datasources/lesson_remote_datasource.dart';
import 'package:ringo/data/models/lesson_word_mapper.dart';
import 'package:ringo/domain/entities/lesson_word.dart';
import 'package:ringo/domain/repositories/lesson_repository.dart';

class LessonRepositoryImpl implements LessonRepository {
  final LessonRemoteDataSource remote;

  LessonRepositoryImpl(this.remote);

  @override
  Future<LessonWord> getLessonWord(int songId) async {
    final model = await remote.getLessonWord(songId: songId);
    return model.toEntity();
  }

  @override
  Future<void> reviewLessonWord(int lessonWordId, int grade) {
    return remote.reviewLessonWord(lessonWordId: lessonWordId, grade: grade);
  }
}
