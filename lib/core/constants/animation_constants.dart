class AnimationConstants {
  static AnimationConstants? _instace;
  static AnimationConstants get instance {
    _instace ??= AnimationConstants._init();
    return _instace!;
  }

  AnimationConstants._init();
  String getJson(String value) => 'assets/animation/$value.json';
}
