import 'package:hive_flutter/hive_flutter.dart';
import '../../../product/constants/hive_constants.dart';
import '../../../product/init/cache/cache_manager.dart';
import '../model/category/category_model.dart';
import '../model/note/note_model.dart';
import '../model/note_theme/note_theme_model.dart';

class NoteCacheManager extends ICacheManager<NoteModel> {
  NoteCacheManager(String key) : super(key);

  @override
  Future<void> addItem(NoteModel item) async {
    await box?.add(item);
  }

  @override
  Future<void> putAtItem(NoteModel item, int index) async {
    await box?.putAt(index, item);
  }

  @override
  Future<void> removeItem(int key) async {
    await box?.deleteAt(key);
  }

  @override
  List<NoteModel>? getValues() {
    return box?.values.toList(); //.reversed.toList();
  }

  @override
  List<NoteModel>? getSearchValues(String key) {
    return box?.values
        .where((e) =>
            e.title.toLowerCase().contains(key.toLowerCase()) ||
            e.body.toLowerCase().contains(key.toLowerCase()))
        .toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.noteTypeId)) {
      Hive.registerAdapter(NoteModelAdapter());
      Hive.registerAdapter(NoteThemeModelAdapter());
      Hive.registerAdapter(CategoryModelAdapter());
    }
  }
}
