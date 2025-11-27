import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ringo/presentation/pages/main_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.dev');
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF659df2),
        body: Center(
          child: MainPage(),
        ),
      ),
    );
  }
}
