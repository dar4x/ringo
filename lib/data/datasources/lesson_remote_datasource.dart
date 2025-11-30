import 'package:ringo/core/network/api_client.dart';
import 'package:ringo/data/models/lesson_word_mapper.dart';

class LessonRemoteDataSource {
  final ApiCleint client;

  LessonRemoteDataSource(this.client);

  Future<LessonWordModel> getLessonWord({
    required int songId,
    bool translation = true,
    bool reading = true,
  }) async {
    final data = await client.get(
      'lessons/$songId/word',
      params: {
        'mode': 'random',
        'translation': translation.toString(),
        'reading': reading.toString(),
      },
    );
    return LessonWordModel.fromJson(data as Map<String, dynamic>);
  }

  Future<void> reviewLessonWord({
    required int lessonWordId,
    required int grade,
  }) async {
    await client.postJson(
      'lessons/word/$lessonWordId/review',
      body: grade,
    );
  }
}
