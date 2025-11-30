import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ringo/core/themes/app_theme.dart';
import 'package:ringo/presentation/viewmodels/lesson_viewmodel.dart';
import 'package:ringo/domain/usecase/get_lesson_word.dart';
import 'package:ringo/domain/usecase/review_lesson_word.dart';

class LessonPage extends StatefulWidget {
  final int songId;
  const LessonPage({super.key, required this.songId});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late final LessonViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = LessonViewModel(
      GetIt.I<GetLessonWord>(),
      GetIt.I<ReviewLessonWord>(),
    );
    vm.loadNext(widget.songId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Кнопка "назад" + заголовок
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Lesson",
          style: AppTheme.title.copyWith(fontSize: 22),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: vm,
            builder: (_, __) {
              if (vm.loading && vm.current == null) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              if (vm.error != null) {
                return Center(
                  child: Text(
                    vm.error!,
                    style: AppTheme.body.copyWith(color: Colors.redAccent),
                  ),
                );
              }
              if (vm.current == null) {
                return Center(
                  child: Text(
                    "Нет слов для изучения",
                    style: AppTheme.body,
                  ),
                );
              }

              final w = vm.current!;

              // Центруем карточку и кнопки
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: AppTheme.cardStyle,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                w.display,
                                style: AppTheme.title.copyWith(fontSize: 24),
                              ),
                              const SizedBox(height: 12),
                              if (w.translation != null)
                                Text(
                                  w.translation!,
                                  style: AppTheme.body.copyWith(fontSize: 18),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Как легко было это слово?",
                          style: AppTheme.body,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _gradeButton("Трудно", 2),
                            _gradeButton("Норм", 4),
                            _gradeButton("Легко", 5),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => vm.loadNext(widget.songId),
                            style: AppTheme.buttonStyle,
                            child: const Text("Следующее слово"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _gradeButton(String label, int grade) {
    return ElevatedButton(
      onPressed: () async {
        await vm.review(grade);
        await vm.loadNext(widget.songId);
      },
      style: AppTheme.buttonStyle.copyWith(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      child: Text(label),
    );
  }
}
