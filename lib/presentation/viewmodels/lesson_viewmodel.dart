import 'package:flutter/material.dart';
import 'package:ringo/domain/entities/lesson_word.dart';
import 'package:ringo/domain/usecase/get_lesson_word.dart';
import 'package:ringo/domain/usecase/review_lesson_word.dart';

class LessonViewModel extends ChangeNotifier {
  final GetLessonWord getLessonWordUseCase;
  final ReviewLessonWord reviewLessonWordUseCase;

  LessonViewModel(this.getLessonWordUseCase, this.reviewLessonWordUseCase);

  LessonWord? current;
  bool loading = false;
  String? error;

  Future<void> loadNext(int songId) async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      current = await getLessonWordUseCase(songId);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }

  Future<void> review(int grade) async {
    if (current == null) return;
    await reviewLessonWordUseCase(current!.lessonWordId, grade);
  }
}
