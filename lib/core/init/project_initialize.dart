import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class IProjectInitialize {
  Future<void> setup();
  IProjectInitialize();
}

class ProjectInitialize implements IProjectInitialize {
  @override
  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
