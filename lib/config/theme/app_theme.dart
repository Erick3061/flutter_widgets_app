import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.teal,
  Colors.pink,
  Colors.red,
  Colors.black,
  Colors.purple,
  Colors.cyan,
  Colors.grey,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0, 'Selected color must be greter then 0'),
        assert(selectedColor < colors.length,
            'Seleted color must be less or equals than ${colors.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colors[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
