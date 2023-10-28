import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color.fromARGB(255, 255, 255, 255),
    primary: Color.fromARGB(255, 72, 72, 82),
    secondary: Color.fromARGB(255, 102, 102, 255),
    tertiary: Color.fromARGB(255, 33, 33, 33),
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 23, 24, 31),
    primary: Color.fromARGB(255, 39, 55, 77),
    secondary: Color.fromARGB(255, 102, 102, 255),
    tertiary: Color.fromARGB(255, 255, 255, 255),
  )
);