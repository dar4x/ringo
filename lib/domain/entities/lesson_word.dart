class LessonWord {
  final int songId;
  final int lessonId;
  final int lessonWordId;
  final String word;
  final String? reading;
  final String display;
  final String? translation;
  final String language;
  final DateTime? nextReviewAt;

  LessonWord({
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
}
