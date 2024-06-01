import 'package:flutter/material.dart';
import '../theme/app_pallete.dart';

class AppTheme {
  static _border(Color color) => InputDecorationTheme(
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      );

  static final lightThemeMode = ThemeData.light().copyWith(
    chipTheme: const ChipThemeData(
      side: BorderSide.none,
    ),
    colorScheme: AppPallete.kColorScheme,
    focusColor: AppPallete.kColorScheme.primary,
    inputDecorationTheme: _border(AppPallete.kColorScheme.primary),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    chipTheme: const ChipThemeData(
      side: BorderSide.none,
    ),
    colorScheme: AppPallete.kDarkColorScheme,
    focusColor: AppPallete.kDarkColorScheme.primary,
    inputDecorationTheme: _border(AppPallete.kDarkColorScheme.primary),
  );
}
