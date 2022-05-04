// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'app_translations.dart';
import 'application.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  final Locale newLocale;

  const AppTranslationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return application.supportedLocales
        .where((f) => f.languageCode == locale.languageCode)
        .toList()
        .isNotEmpty;
  }

  @override
  Future<AppTranslations> load(Locale locale) async {
    return AppTranslations.load(newLocale ?? locale);
  }
  // @override
  // Future<AppTranslations> load(Locale locale) async {
  //   AppTranslations localizations = AppTranslations(locale);
  //   await localizations.load(newLocale ?? locale);

  //   return localizations;
  // }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}
