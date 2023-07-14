import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double screenHeightPercent(int percent) =>
      MediaQuery.of(this).size.height * (percent / 100);
  double screenWidthPercent(int percent) =>
      MediaQuery.of(this).size.width * (percent / 100);
}
