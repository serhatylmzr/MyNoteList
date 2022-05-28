import 'package:hive_flutter/hive_flutter.dart';
import 'package:mynotelist/core/extensions/string_extension.dart';
import '../../../product/constants/hive_constants.dart';
import '../../../product/init/cache/cache_manager.dart';
import '../model/category/category_model.dart';
import '../model/note/note_model.dart';
import '../model/note_theme/note_theme_model.dart';

class NoteCacheManager extends ICacheManager<NoteModel> {
  NoteCacheManager(String key) : super(key);

  @override
  Future<void> putItem(NoteModel item) async {
    await box?.put(item.noteId, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  List<NoteModel>? getValues() {
    var items = box?.values.toList();
    items?.sort((a, b) => a.created.microsecondsSinceEpoch
        .compareTo(b.created.microsecondsSinceEpoch));
    return items?.reversed.toList();
  }

  @override
  List<NoteModel>? getSearchValues(String key) {
    return box?.values
        .where((e) =>
            e.title.toLowerCase().contains(key.toLowerCase()) ||
            e.body.toLowerCase().contains(key.toLowerCase()) ||
            e.category.category.locale
                .toLowerCase()
                .contains(key.toLowerCase()))
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
