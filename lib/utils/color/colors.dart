import 'package:flutter/material.dart';

class ScaffoldColor{
  ScaffoldColor._();

  // Primary Color
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF004C92), // blueLight
      Color(0xFF1AA9F4), // blueDark
    ],
  );

}