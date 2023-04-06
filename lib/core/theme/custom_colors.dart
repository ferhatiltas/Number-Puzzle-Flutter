import 'package:flutter/material.dart';

class CustomAppColors {
  static CustomAppColors? _instance;
  static CustomAppColors get instance {
    _instance ??= _instance = CustomAppColors._init();
    return _instance!;
  }

  CustomAppColors._init();
  final primaryColor = const Color(0xFFEE3025);
  final grey = Colors.grey;
  final black = Colors.black;
}
