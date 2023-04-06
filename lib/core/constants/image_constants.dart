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

}
