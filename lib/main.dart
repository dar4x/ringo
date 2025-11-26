import 'package:flutter/material.dart';
import 'package:ringo/presentation/pages/main_page.dart';

const BASE_URL = 'http://127.0.0.1:8000/song/';
void main() {
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
