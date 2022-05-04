// @dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppTranslations {
  Locale locale;
  static Map<dynamic, dynamic> _localisedValues;

  AppTranslations(this.locale);

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    final appTranslations = AppTranslations(locale);
    // rootBundle.loadString("lang/I18n_${locale.languageCode}.json").then(
    //   (value) {
    //     _localisedValues = json.decode(value) as Map;
    //   },
    // );
    String data =
        await rootBundle.loadString('lang/I18n_${locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);
    _sentences = Map();
    _result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return appTranslations;
  }

  String get currentLanguage => locale.languageCode;

  // String text(String key) {
  //   if (_localisedValues != null && _localisedValues.containsKey(key)) {
  //     return _localisedValues[key] as String;
  //   } else {
  //     print("Translation warning: the key $key not found");
  //     return "";
  //   }
  // }

  static Map<String, String> _sentences;

  // Future<AppTranslations> load(Locale locale) async {
  //   String data =
  //       await rootBundle.loadString('lang/I18n_${locale.languageCode}.json');
  //   Map<String, dynamic> _result = json.decode(data);
  //   this._sentences = Map();
  //   _result.forEach((String key, dynamic value) {
  //     this._sentences[key] = value.toString();
  //   });

  //   // return true;
  // }

  String text(String key) {
    try {
      var result = _sentences[key];
      return result == null ? '$key Expection' : result;
    } catch (ex) {
      return '$key Expection';
    }
  }
}
