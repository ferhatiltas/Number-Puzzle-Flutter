class SvgConstants {
  static SvgConstants? _instance;
  static SvgConstants get instance {
    _instance ??= _instance = SvgConstants._init();
    return _instance!;
  }

  SvgConstants._init();
  String toSvg(String value) => 'assets/svg/$value.svg';

  // MARK: - Onboarding View
  String get onboard1 => toSvg('onboard1');
  String get onboard2 => toSvg('onboard2');
  String get onboard3 => toSvg('onboard3');
  String get onboard1Background => toSvg('onboard1_background');
  String get onboard2Background => toSvg('onboard2_background');
  String get onboard3Background => toSvg('onboard3_background');
  String get onboard33Background => toSvg('onboard33_background');
}
