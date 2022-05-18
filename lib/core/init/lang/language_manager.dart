import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();

  List<Locale> get supportedLocales => [
        LocaleUtility().enLocale,
        LocaleUtility().trLocale,
        LocaleUtility().spLocale,
        LocaleUtility().deLocale,
        LocaleUtility().frLocale
      ];
}

class LocaleUtility {
  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');
  final spLocale = const Locale('es', 'SP');
  final deLocale = const Locale('de', 'DE');
  final frLocale = const Locale('fr', 'FR');
}
