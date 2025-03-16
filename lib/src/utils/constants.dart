class Constants {
  Constants._();
  static late Dimens dimens;
  static void init() {
    dimens = Dimens();
  }

  static const String appName = 'Flutter Demo';
}

class Dimens {
  double paddingSmall = 8.0;
  double paddingMedium = 16.0;
  double paddingLarge = 24.0;
}
