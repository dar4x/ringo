import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            "Ring0",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 50,
              color: Colors.white,
              fontFamily: 'Spoof',
            ),
          ),
        ),
      ),
    );
  }
}
