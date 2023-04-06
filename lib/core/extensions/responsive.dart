import 'package:flutter/material.dart';

class ResponsivitiveManager {
  static ResponsivitiveManager? _instance;
  static ResponsivitiveManager get instance {
    _instance ??= ResponsivitiveManager._init();
    return _instance!;
  }

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 500 || MediaQuery.of(context).size.width <= 700;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1024;
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;

  ResponsivitiveManager._init();
}
