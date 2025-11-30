import 'package:flutter/material.dart';
import 'package:ringo/core/themes/app_theme.dart';

class AppButton extends StatefulWidget {
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
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails _) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails _) {
    setState(() => _isPressed = false);
    widget.onPressed();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _isPressed = true,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 450,
          height: 65,
          decoration: BoxDecoration(
            color: AppTheme.midnight,
            borderRadius: BorderRadius.circular(22),
            boxShadow: _isPressed
                ? [
                    // Вдавленная тень
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(2, 2),
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      color: AppTheme.midnightLight.withOpacity(0.3),
                      offset: const Offset(-2, -2),
                      blurRadius: 8,
                    ),
                  ]
                : [
                    // Выпуклые тени
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: const Offset(6, 6),
                      blurRadius: 12,
                    ),
                    BoxShadow(
                      color: AppTheme.midnightLight.withOpacity(0.8),
                      offset: const Offset(-6, -6),
                      blurRadius: 12,
                    ),
                  ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title,
                    style: AppTheme.body.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                const SizedBox(width: 10),
                Icon(widget.icon, size: 22, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
