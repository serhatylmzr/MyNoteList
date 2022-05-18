import 'package:hive_flutter/hive_flutter.dart';

abstract class ICacheManager<T> {
  final String key;
  Box<T>? _box;
  Box<T>? get box => _box;
  ICacheManager(this.key);

  Future<void> init() async {
    registerAdapters();

    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  void registerAdapters();
  Future<void> addItem(T item);
  List<T>? getValues();
  Future<void> putAtItem(T item, int index);
  Future<void> removeItem(int key);
  Future<void> clearAll() async {
    await _box?.clear();
  }

  List<T>? getSearchValues(String key);
}
