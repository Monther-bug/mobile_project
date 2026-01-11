import 'package:flutter/material.dart';

class AppColors {
 
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryWhite = Color(0xFFFFFFFF);

  static const List<Color> mainGradient = [primaryBlack, primaryBlack];

  static const Color scaffoldBackground = primaryWhite;
  static const Color glassBackground = primaryWhite;
  static const Color inputFill = Color(0xFFF5F5F5);
  static const Color border = Colors.transparent;
  static Color shadow = const Color.fromRGBO(0, 0, 0, 0.05);

  static const Color textBlack = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF757575);
  static const Color textLightGrey = Color(0xFFBDBDBD);

  static const Color darkPrimaryBlack = Color(0xFFFFFFFF);
  static const Color darkPrimaryWhite = Color(0xFF121212);

  static const List<Color> darkMainGradient = [Color(0xFF1E1E1E), Color(0xFF121212)];

  static const Color darkScaffoldBackground = Color(0xFF121212);
  static const Color darkGlassBackground = Color(0xFF1E1E1E);
  static const Color darkInputFill = Color(0xFF2C2C2C);
  static const Color darkBorder = Color(0xFF3D3D3D);
  static Color darkShadow = const Color.fromRGBO(0, 0, 0, 0.3);

  static const Color darkTextBlack = Color(0xFFE1E1E1);
  static const Color darkTextGrey = Color(0xFFB0B0B0);
  static const Color darkTextLightGrey = Color(0xFF6B6B6B);

  static Color getPrimaryBlack(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkPrimaryBlack 
        : primaryBlack;
  }

  static Color getPrimaryWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkPrimaryWhite 
        : primaryWhite;
  }

  static Color getScaffoldBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkScaffoldBackground 
        : scaffoldBackground;
  }

  static Color getGlassBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkGlassBackground 
        : glassBackground;
  }

  static Color getInputFill(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkInputFill 
        : inputFill;
  }

  static Color getBorder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkBorder 
        : border;
  }

  static Color getShadow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkShadow 
        : shadow;
  }

  static Color getTextBlack(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkTextBlack 
        : textBlack;
  }

  static Color getTextGrey(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkTextGrey 
        : textGrey;
  }

  static Color getTextLightGrey(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkTextLightGrey 
        : textLightGrey;
  }

  static List<Color> getMainGradient(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? darkMainGradient 
        : mainGradient;
  }
}

