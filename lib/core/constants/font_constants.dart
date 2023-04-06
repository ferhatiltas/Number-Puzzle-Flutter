// ignore_for_file: non_constant_identifier_names, duplicate_ignore
class FontsConstants {
  static FontsConstants? _instance;
  static FontsConstants get instance {
    _instance ??= FontsConstants._init();
    return _instance!;
  }

  FontsConstants._init();
  final AVENIR_BLACK = 'AVENIR_BLACK';
  final AVENIR_BOOK = 'AVENIR_BOOK';
  final AVENIR_ROMAN = 'AVENIR_ROMAN';
  final AVENIR_MEDIUM = 'AVENIR_MEDIUM';
}
