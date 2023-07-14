import 'package:flutter/material.dart';

//const Color primary = Color(0xFF25A0B0);
// Color primaryColor = const Color(0xFF3EBACE);
// Color accentColor = const Color(0xFFD8ECF1);
//Color bgColor = const Color(0xFFF3F5F7);

const primaryColor = Colors.deepPurple;
final accentColor = Colors.deepPurple.withOpacity(0.2);
const bgColor = Colors.white;
const Color lightGreyColor = Color(0xFFE7EBEE);
const Color greyColor = Color(0xFFB4C1C4);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
