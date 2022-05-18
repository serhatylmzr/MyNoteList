import 'package:hive_flutter/adapters.dart';

import '../../../../product/constants/hive_constants.dart';
import '../category/category_model.dart';
import '../note_theme/note_theme_model.dart';

part 'note_model.g.dart';

@HiveType(typeId: HiveConstants.noteTypeId)
class NoteModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String body;

  @HiveField(2)
  final NoteThemeModel noteTheme;

  @HiveField(3)
  final CategoryModel category;

  @HiveField(4)
  final DateTime created;

  NoteModel(
      {required this.title,
      required this.body,
      required this.noteTheme,
      required this.category,
      required this.created});
}
