import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ringo/core/di/service_locator.dart';
import 'package:ringo/core/themes/app_theme.dart';
import 'package:ringo/presentation/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env.dev");

  setupDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        inputDecorationTheme: AppTheme.inputTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppTheme.buttonStyle,
        ),
      ),
      home: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: MainPage(),
      ),
    );
  }
}
