import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppLocale extends Equatable {
  final String language;
  final String languageCode;
  final String? countryCode;

  const AppLocale({
    required this.language,
    required this.languageCode,
    this.countryCode,
  });

  Locale get toLocale => Locale(languageCode, countryCode);
  factory AppLocale.fromLocale(Locale locale) {
    return AppLocale(
      language: "",
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
    );
  }

  @override
  List<Object> get props => [
        languageCode,
        // countryCode
      ];
}
