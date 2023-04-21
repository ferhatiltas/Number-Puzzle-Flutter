class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();
  String toPng(value) => 'assets/images/$value.png';
  String toJpg(value) => 'assets/images/$value.jpg';
  String toJpeg(value) => 'assets/images/$value.jpeg';

  // MARK: - Onboarding View
  String get onboard1 => toPng('onboard1');
  String get onboard2 => toPng('onboard2');
  String get onboard3 => toPng('onboard3');

  String get example => toPng('example');
}
