import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFFFFFF);
  // static const Color primaryColor = Color(0xFFAAAAAA);
  static const Color black87 = Colors.black87;
  static const Color black54 = Colors.black54;
  static const Color black45 = Colors.black45;
  static const Color black38 = Colors.black38;
  static const Color black26 = Colors.black26;
  static const Color black12 = Colors.black12;
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  // Convert Color to MaterialColor to use primarySwatch
  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

  // Contain use by flexibleSpace in appBar => Create gradient background
  static Container flexibleSpace = Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color(0xFFFCF6BD),
          const Color(0xFFF5DD90),
          // const Color(0xFFEB6F99),
          // const Color(0xFFFF828F),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    ),
  );
  static Container flexibleSpaceWhite = Container(
    decoration: BoxDecoration(color: Colors.white),
  );

  static BoxDecoration decorationGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        const Color(0xFFFCF6BD),
        const Color(0xFFF5DD90),
        // const Color(0xFFEB6F99),
        // const Color(0xFFFF828F),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    ),
  );
}
