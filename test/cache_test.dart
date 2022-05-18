import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_note_app/core/init/lang/language_manager.dart';

void main() {
  setUp(() {
    Hive.init('database');
  });
  test('Hive Box Create and Put', () async {
    final box = await Hive.openBox<String>('databox');
    for (var i = 0; i < 100; i++) {
      await box.add('data $i');
    }

    expect(box.values.first, 'data 0');
  });

  test('Theme Cache with Hive', () async {
    final themeBox = await Hive.openBox<bool>('theme');
    await themeBox.put('theme', true);

    expect(themeBox.get('theme'), true);
  });

  test('Setting Box', () async {
    const bool isDark = true;
    final String language =
        LanguageManager.instance.supportedLocales[0].languageCode;

    final settingBox = await Hive.openBox('setting');
    await settingBox.put('theme', isDark);
    await settingBox.put('language', language);
    final bool themeResult = settingBox.get('theme');
    final String langResult = settingBox.get('language');
    //final key = settingBox.putAt(1, false);
    expect(themeResult, isDark);
    expect(langResult, language);
  });
}
