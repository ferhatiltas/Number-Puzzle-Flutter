import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
}
