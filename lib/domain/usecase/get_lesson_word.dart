import 'package:ringo/domain/entities/lesson_word.dart';
import 'package:ringo/domain/repositories/lesson_repository.dart';

class GetLessonWord {
  final LessonRepository repository;

  GetLessonWord(this.repository);

  Future<LessonWord> call(int songId) => repository.getLessonWord(songId);
}
