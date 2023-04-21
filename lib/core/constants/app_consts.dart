class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants get instance {
    _instance ??= ApplicationConstants._init();
    return _instance!;
  }

  ApplicationConstants._init();
  final String onboardTitle1 = "Matematiğiniz Geliştirin";
  final String onboardDescription1 =
      "Uygulamada size sorulan matematik sorularını çözüp doğru cevabı bulduğunuzda doğru cevabı bulmaca içinden bulup işeretleyin ve puanları toplayın.";
  final String onboardTitle2 = "Görsel Zeka";
  final String onboardDescription2 =
      "Sorulan sorularda doğru cevabı çözdükten sonra bulmaca içinden ilgili cevabı bulun böylelikle görsel zekanız ve problem çözme yeteneğiniz artsın.";
  final String onboardTitle3 = "Cevapları İşaretleyin";
  final String onboardDescription3 =
      'Çözdüğünüz soruların cevaplarını bulmacada işaretleyin böylelikle tüm bulmacayı çözmüş ve parçaları birleştirmiş olacaksınız. Sonraki sorular daha zevkli... :)';
}
