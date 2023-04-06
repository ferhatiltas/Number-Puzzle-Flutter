class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants get instance {
    _instance ??= ApplicationConstants._init();
    return _instance!;
  }

  ApplicationConstants._init();
  final String onboardTitle1 = "Lorem başlık";
  final String onboardDescription1 =
      "Bu bir denemedir yağlı şaka ünlü  çabuk consectetur. Egestas ut lectus velit feugiat eleifend eget.Lorem ipsum dolor sit amet consectetur. Egestas ut lectus velit eget.";
  final String onboardTitle2 = "Lorem baslık";
  final String onboardDescription2 =
      "Bu bir denemedir yağlı şaka ünlü  çabuk consectetur ut lectus velit feugiat eleifend eget.Lorem ipsum dolor sit amet consectetur. Egestas ut lectus velit eget.";
  final String onboardTitle3 = "Lorem baslık";
  final String onboardDescription3 =
      'Lorem ipsum dolor sit amet consectetur. Egestas ut lectus velit feugiat eleifend eget.Lorem ipsum dolor sit amet consectetur. Egestas ut lectus velit eget.';
}
