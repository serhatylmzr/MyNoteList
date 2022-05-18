import 'package:hive_flutter/adapters.dart';

import '../../../../product/constants/hive_constants.dart';

part 'note_theme_model.g.dart';

@HiveType(typeId: HiveConstants.noteTypeNoteThemeId)
class NoteThemeModel {
  @HiveField(0)
  int textColor;
  @HiveField(1)
  String background;

  NoteThemeModel({
    required this.textColor,
    required this.background,
  });
}
