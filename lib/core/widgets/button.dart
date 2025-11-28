import 'package:flutter/material.dart';
import 'package:ringo/core/themes/app_theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 65,
      decoration: AppTheme.neumorphic(radius: 22),
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppTheme.buttonStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: AppTheme.body.copyWith(fontSize: 20)),
            const SizedBox(width: 10),
            Icon(icon, size: 22, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
