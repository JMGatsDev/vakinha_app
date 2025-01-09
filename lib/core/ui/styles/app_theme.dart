import 'package:flutter/material.dart';

import 'constants.dart';

sealed class AppTheme {
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primaryColor: ColorsApp.primary,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsApp.primary,
        primary: ColorsApp.primary,
        secondary: ColorsApp.secondary),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: MyTextStyles.textRegular.copyWith(color: Colors.black),
      errorStyle: MyTextStyles.textRegular.copyWith(color: Colors.red),
    ),
  );
}
