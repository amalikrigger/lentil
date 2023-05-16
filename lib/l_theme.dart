import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

class LTheme extends StatelessWidget {
  const LTheme({
    Key? key,
  }) : super(key: key);
  final ThemeMode themeMode = ThemeMode.light;

  final colorSchemeLight = const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: Color(0xff03dac6),
    onSecondary: Colors.black,
    error: Color(0xffb00020),
    onError: Colors.white,
    background: Colors.black,
    onBackground: Color(0xFFEFEFF4),
    surface: Color(0xFFEFEFF4),
    onSurface: Colors.black,
    surfaceVariant: Colors.white,
    onSurfaceVariant: Color(0xFF8A8A8F),
    tertiary: Colors.white,
    onTertiary: Color(0xFFD8D8D8),
  );

  final colorSchemeDark = const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xffbb86fc),
    onPrimary: Colors.black,
    secondary: Color(0xff03dac6),
    onSecondary: Colors.black,
    error: Color(0xffcf6679),
    onError: Colors.white,
    background: Color(0xFF121212),
    onBackground: Color(0xFFEFEFF4),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFEFEFF4),
    surfaceVariant: Colors.black,
    onSurfaceVariant: Color(0xFF8A8A8F),
    tertiary: Colors.black,
    onTertiary: Color(0xFFD8D8D8),
  );

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: colorSchemeLight.primary,
      colorScheme: colorSchemeLight,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorSchemeLight.onSurface,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: colorSchemeLight.surfaceVariant,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: colorSchemeLight.onBackground),
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: colorSchemeLight.onSurface,
        ),
        headlineSmall: TextStyle(
          fontSize: 17,
          color: colorSchemeLight.onSurfaceVariant,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: colorSchemeLight.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 17,
          color: colorSchemeLight.onSurface,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: colorSchemeLight.onSurface,
        ),
        labelMedium: TextStyle(
          fontSize: 17,
          color: colorSchemeLight.onSurface,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          color: colorSchemeLight.onSurface,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData().copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeLight.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeLight.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeLight.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeLight.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeLight.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextStyle(
          fontSize: 17,
          color: colorSchemeLight.onSurface,
        ),
        fillColor: colorSchemeLight.surface,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return colorSchemeLight
                  .primary; // the color when checkbox is selected;
            }
            return colorSchemeLight
                .background; //the color when checkbox is unselected;
          },
        ),
        side: BorderSide(
          color: colorSchemeLight.onTertiary,
        ),
        shape: const CircleBorder(),
        checkColor: MaterialStateProperty.all(
          colorSchemeLight.onPrimary,
        ),
      ),
    );

    final darkTheme = ThemeData.dark().copyWith(
      // scaffoldBackgroundColor: Colors.black45,
      primaryColor: colorSchemeDark.primary,
      colorScheme: colorSchemeDark,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.onSurface,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: colorSchemeDark.surfaceVariant,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: colorSchemeDark.onBackground),
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.onSurface,
        ),
        headlineSmall: TextStyle(
          fontSize: 17,
          color: colorSchemeDark.onSurfaceVariant,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: colorSchemeDark.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 17,
          color: colorSchemeDark.onSurface,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: colorSchemeDark.onSurface,
        ),
        labelMedium: TextStyle(
          fontSize: 17,
          color: colorSchemeDark.onSurface,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          color: colorSchemeDark.onSurface,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData().copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeDark.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeDark.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeDark.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeDark.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSchemeDark.surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextStyle(
          fontSize: 17,
          color: colorSchemeLight.onSurface,
        ),
        fillColor: colorSchemeDark.surface,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return colorSchemeDark
                  .primary; // the color when checkbox is selected;
            }
            return colorSchemeDark
                .background; //the color when checkbox is unselected;
          },
        ),
        side: BorderSide(
          color: colorSchemeDark.onTertiary,
        ),
        shape: const CircleBorder(),
        checkColor: MaterialStateProperty.all(
          colorSchemeDark.onPrimary,
        ),
      ),
    );

    return MaterialApp(
      title: 'Lentil',
      // showPerformanceOverlay: true,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const SplashScreen(),
    );
  }
}
