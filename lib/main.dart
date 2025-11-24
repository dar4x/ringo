import 'package:flutter/material.dart';
import 'package:ringo/presentation/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF659df2),
        body: Center(
          child: MainPage(),
        ),
      ),
    );
  }
}
