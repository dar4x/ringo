import 'package:ringo/domain/entities/lesson_word.dart';

abstract class LessonRepository {
  Future<LessonWord> getLessonWord(int songId);
  Future<void> reviewLessonWord(int lessonWordId, int grade);
}
