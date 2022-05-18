import 'locale_keys.g.dart';

extension LanguageExtension on String {
  String get getLangFullName {
    switch (this) {
      case 'en':
        return LocaleKeys.profilePage_language_english;
      case 'tr':
        return LocaleKeys.profilePage_language_turkish;
      case 'es':
        return LocaleKeys.profilePage_language_spanish;
      case 'de':
        return LocaleKeys.profilePage_language_german;
      case 'fr':
        return LocaleKeys.profilePage_language_french;
      default:
        return 'No language';
    }
  }
}
