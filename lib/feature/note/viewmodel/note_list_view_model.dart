import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/model/base_view_model.dart';

import '../../../product/init/navigation/navigation_enums.dart';
import '../../note/cubit/note_cubit.dart';

class NoteListViewModel extends BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  late final noteCubit = BlocProvider.of<NoteCubit>(context);
  void init() {
    _getNotes();
  }

  void onDispose() {}
  void navigateNoteDetail(Object data) {
    navigationManager.navigateToPage(
        path: NavigationEnums.noteDetail.rawValue, data: data);
  }

  void navigateAddNote() {
    navigationManager.navigateToPageClear(
        path: NavigationEnums.addNote.rawValue);
  }

  Future<void> _getNotes() async {
    await noteCubit.getNotes();
  }

  Future<void> deleteNote(String key) async {
    await noteCubit.deleteNote(key);
  }
}
