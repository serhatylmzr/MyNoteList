import 'package:hive_flutter/hive_flutter.dart';

class SettingCacheManager {
  final String key = 'setting';
  Box? _box;
  Box? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> cacheTheme(bool darkMode) async {
    await init();
    await box?.put('theme', darkMode);
  }

  getTheme() {
    var darkMode = box?.get('theme', defaultValue: false);
    return darkMode;
  }

  Future<void> cacheInit(bool initFirstApp) async {
    await init();
    await box?.put('initialize', initFirstApp);
  }

  Future<bool> getInit() async {
    await init();
    bool initFirstApp = await box?.get('initialize', defaultValue: false);
    return initFirstApp;
  }

  void registerAdapters() {}
}
