import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../model/note_theme/note_theme_model.dart';
import '../service/note_cache_manager.dart';
import '../../../product/constants/color_constants.dart';
import '../../../product/init/lang/locale_keys.g.dart';
import '../model/category/category_model.dart';
import '../model/note/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteCacheManager _noteCacheManager = NoteCacheManager('notes');
  NoteCubit()
      : super(
          NoteState(
              category: CategoryModel(
                  id: 1,
                  category: LocaleKeys.notes_category_no_list,
                  color: CategoryColors.darkGreen),
              noteTheme: NoteThemeModel(
                  textColor: NoteThemeColors.textColorBlack,
                  background: NoteThemeColors.lightYellow)),
        ) {
    initalComplete();
  }
  Future<void> initalComplete() async {
    await Future.microtask(() {});
    await Future.wait([
      getNotes(),
    ]);
  }

  void changelistToGrid() {
    emit(state.copyWith(isGrid: !(state.isGrid)));
  }

  void changeSelectedCategory(CategoryModel? category) {
    emit(state.copyWith(category: category));
  }

  void changeNoteTheme(NoteThemeModel? noteTheme) {
    emit(state.copyWith(noteTheme: noteTheme));
  }

  void addNote(NoteModel note) async {
    await _noteCacheManager.init();
    await _noteCacheManager.addItem(note);
    getNotes();
  }

  void updateNote(NoteModel note, int index) async {
    await _noteCacheManager.init();
    _noteCacheManager.putAtItem(note, index);
    getNotes();
  }

  Future<List<NoteModel>?> getNotes() async {
    List<NoteModel>? notes;
    await _noteCacheManager.init();

    if (_noteCacheManager.getValues()?.isNotEmpty ?? false) {
      notes = _noteCacheManager.getValues();
      emit(state.copyWith(noteList: notes));
    } else {
      notes = [];
    }
    return notes;
  }

  void getSearchNotes(String key) async {
    await _noteCacheManager.init();
    if (_noteCacheManager.getSearchValues(key)?.isNotEmpty ?? false) {
      List<NoteModel>? notes = _noteCacheManager.getSearchValues(key);
      emit(state.copyWith(noteList: notes));
    }
  }

  Future<void> deleteNote(int key) async {
    _noteCacheManager.removeItem(key);
    emit(state.copyWith(noteList: _noteCacheManager.getValues()));
    //listenNoteList();
  }
}
