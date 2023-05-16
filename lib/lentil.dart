import 'package:flutter/material.dart';

import 'l_theme.dart';

class Lentil extends StatelessWidget {
  const Lentil({super.key});
  final ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return const LTheme();
  }
}
