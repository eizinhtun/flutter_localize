// @dart=2.9

import 'dart:ui';
import 'app_locale.dart';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  List<AppLocale> get appLocales => const [
        AppLocale(language: "English", languageCode: "en", countryCode: "US"),
        AppLocale(language: "Burmese", languageCode: "my", countryCode: "MM"),
      ];

  AppLocale getAppLocaleFromLanguage(String language) =>
      appLocales.firstWhere((f) => f.language == language,
          orElse: () => appLocales.first);

  List<Locale> get supportedLocales =>
      appLocales.map((f) => f.toLocale).toList();

  LocaleChangeCallback onLocaleChanged;

  List<String> get dateFormats => [
        "dd/mm/yy",
      ];
  List<String> get currencies => [
        "MMK",
      ];
}

Application application = Application();
typedef LocaleChangeCallback = void Function(Locale locale);
