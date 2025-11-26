import 'package:flutter/material.dart';
import 'package:ringo/core/widgets/button.dart';
import 'package:ringo/core/widgets/header.dart';
import 'package:ringo/core/widgets/search.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Header(),
          SizedBox(height: 160),
          SearchTextField(),
          Spacer(),
          AppButton(title: 'Upload File .txt'),
          SizedBox(height: 10),
          AppButton(title: 'Upload File mp3'),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
