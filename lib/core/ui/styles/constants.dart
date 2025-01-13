import 'package:flutter/material.dart';

sealed class ColorsApp {
  static const primary = Color(0XFF007D21);
  static const secondary = Color(0xFFF88B0C);
}

sealed class AppStyles {
  static final primaryButton = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      backgroundColor: ColorsApp.primary,
      textStyle: MyTextStyles.textButtonLabel);
}

sealed class MyTextStyles {
  static const String font = 'mplus1';
  static const textLight = TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: font,
  );
  static const textRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: font,
  );
  static const textMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: font,
  );
  static const textSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: font,
  );
  static const textBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: font,
  );
  static const textExtraBold = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: font,
  );

  static final textButtonLabel = textBold.copyWith(fontSize: 14);
  static final textTitle = textExtraBold.copyWith(fontSize: 28);
}
