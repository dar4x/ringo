import 'package:ringo/domain/entities/lesson_word.dart';

class LessonWordModel {
  final int songId;
  final int lessonId;
  final int lessonWordId;
  final String word;
  final String? reading;
  final String display;
  final String? translation;
  final String language;
  final DateTime? nextReviewAt;

  LessonWordModel({
    required this.songId,
    required this.lessonId,
    required this.lessonWordId,
    required this.word,
    this.reading,
    required this.display,
    this.translation,
    required this.language,
    this.nextReviewAt,
  });

  factory LessonWordModel.fromJson(Map<String, dynamic> json) {
    return LessonWordModel(
      songId: json['songId'] ?? 0,
      lessonId: json['lessonId'] ?? 0,
      lessonWordId: json['lessonWordId'] ?? 0,
      word: json['word'] ?? '',
      reading: json['reading'],
      display: json['display'] ?? '',
      translation: json['translation'],
      language: json['language'] ?? '',
      nextReviewAt: json['nextReviewAt'] != null
          ? DateTime.parse(json['nextReviewAt'] as String)
          : null,
    );
  }
}

extension LessonWordModelX on LessonWordModel {
  LessonWord toEntity() => LessonWord(
        songId: songId,
        lessonId: lessonId,
        lessonWordId: lessonWordId,
        word: word,
        reading: reading,
        display: display,
        translation: translation,
        language: language,
        nextReviewAt: nextReviewAt,
      );
}
