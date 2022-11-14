import 'package:flutter/material.dart';

const Color white = Colors.white;
const Color whiteShade700 = Color(0XFFF5F7F7);

const Color black = Colors.black;
const Color grey = Color(0XFFC5C5C5);
const Color greyShade700 = Color.fromRGBO(59, 59, 59, .5);

const Color blue = Color(0xFF1E2290);
const Color lighBlue = Color(0XFFF5F6F8);

const Color greyShade100 = Color(0xFFF8F8F8);
const Color greyShade500 = Color(0xFFBBBBBB);

const Color transparent = Colors.transparent;

const Color primaryColor = Color(0xFFFFA72C);
const Color yellowShade200 = Color(0xFFFEEFD0);
const Color yellowShade900 = Color(0xFFFFC700);

const Color green = Color(0xFF00A839);

const Color red = Color(0xFFF80000);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
