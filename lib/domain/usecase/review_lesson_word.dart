import 'package:ringo/domain/repositories/lesson_repository.dart';

class ReviewLessonWord {
  final LessonRepository repository;

  ReviewLessonWord(this.repository);

  Future<void> call(int lessonWordId, int grade) =>
      repository.reviewLessonWord(lessonWordId, grade);
}
