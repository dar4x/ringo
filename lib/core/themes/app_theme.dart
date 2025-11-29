import 'package:flutter/material.dart';

class AppTheme {
  // -----------------------------
  // 🎨 Основная цветовая палитра
  // -----------------------------
  static const Color midnightDark = Color(0xFF0A0F1F);
  static const Color midnight = Color(0xFF101A3C);
  static const Color midnightLight = Color(0xFF1C2750);
  static const Color whiteSoft = Color(0xFFF5F6FA);
  static const Color greySoft = Color(0xFFBFC2CC);

  // ------------------------------------
  // 📌 Градиент (фон всего приложения)
  // ------------------------------------
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      midnightDark,
      midnight,
      midnightLight,
    ],
  );

  // ------------------------------------
  // 🔤 Стиль текста
  // ------------------------------------
  static const TextStyle title = TextStyle(
    fontFamily: 'Spoof',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Spoof',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Spoof',
    fontSize: 18,
    color: Colors.white70,
  );

  static const TextStyle lyrics = TextStyle(
    fontFamily: 'Spoof',
    fontFamilyFallback: ['NotoSans', 'Roboto'],
    fontSize: 20,
    height: 1.5,
    color: Colors.white,
  );

  // ------------------------------------
  // 🌫 Neumorphism (выпуклый инпут/карточки)
  // ------------------------------------
  static BoxDecoration neumorphic({double radius = 20}) {
    return BoxDecoration(
      color: midnight,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.6),
          offset: const Offset(6, 6),
          blurRadius: 12,
        ),
        BoxShadow(
          color: midnightLight.withOpacity(0.8),
          offset: const Offset(-6, -6),
          blurRadius: 12,
        )
      ],
    );
  }

  // ------------------------------------
  // 🟦 Input Style
  // ------------------------------------
  static InputDecorationTheme inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: midnight,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    hintStyle: const TextStyle(color: greySoft),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
  );

  // ------------------------------------
  // 🔘 Кнопки
  // ------------------------------------
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: midnight,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    textStyle: const TextStyle(fontSize: 20, fontFamily: 'Spoof'),
    elevation: 10,
    shadowColor: Colors.black87,
  );

  // ------------------------------------
  // 🗂 Карточки (результат поиска)
  // ------------------------------------
  static BoxDecoration cardStyle = neumorphic(radius: 22);
}
