import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/model/base_view_model.dart';
import '../model/note/note_model.dart';
import '../../setting/cubit/setting_cubit.dart';
import '../../../product/init/noteCategory/note_category_manager.dart';
import '../../../product/init/noteTheme/note_theme_manager.dart';
import '../../../product/init/navigation/navigation_enums.dart';
import '../cubit/note_cubit.dart';
import '../model/category/category_model.dart';
import '../model/note_theme/note_theme_model.dart';

class NoteViewModel with BaseViewModel {
  //init
  TextEditingController titleTextController = TextEditingController();
  TextEditingController contentTextController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  List<CategoryModel> categories = [];
  List<NoteThemeModel> noteThemes = [];
  final NoteThemeManager _noteThemeManager = NoteThemeManager.instance;
  final NoteCategoryManager _categoryManager = NoteCategoryManager.instance;
  NoteModel? note;
  String? noteKey;
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  late RouteSettings? setting = ModalRoute.of(context)?.settings;
  late final noteCubit = BlocProvider.of<NoteCubit>(context);
  late final settingCubit = BlocProvider.of<SettingCubit>(context);

  void init() async {
    categories = _categoryManager.categories;
    noteThemes = changeNoteThemeList(noteThemes);
    fetchNoteDetail(setting?.arguments);
  }

  //Dispose
  void onDispose() {
    _clearText();
    titleTextController.dispose();
    contentTextController.dispose();
  }

  void _clearText() {
    titleTextController.clear();
    contentTextController.clear();
  }

  //state
  void selectedNoteTheme(NoteThemeModel noteTheme) {
    noteCubit.changeNoteTheme(noteTheme);
  }

  void selectedCategory(CategoryModel category) {
    noteCubit.changeSelectedCategory(category);
  }

  //Navigate
  void _navigateToHome() {
    navigationManager.navigateToPageClear(path: NavigationEnums.home.rawValue);
  }

  //Note Detail
  void fetchNoteDetail(Object? arguments) {
    if (setting?.arguments != null) {
      final arguments = setting?.arguments as List;
      final note = arguments[0] as NoteModel;
      noteKey = note.noteId;
      titleTextController.text = note.title;
      contentTextController.text = note.body;
      selectedNoteTheme(note.noteTheme);
      noteCubit.changeSelectedCategory(note.category);
    } else {
      noteKey = 'note ' +
          created.microsecond.toString() +
          created.millisecond.toString();
    }
  }

  //state
  List<NoteThemeModel> changeNoteThemeList(noteThemes) {
    noteThemes = _noteThemeManager.noteThemes;
    if (!settingCubit.state.darkMode) {
      final noteThemeLight = _noteThemeManager.colorThemeLight;
      noteThemes[4] = noteThemeLight;
      selectedNoteTheme(noteThemeLight);
    } else {
      final noteThemeDark = _noteThemeManager.colorThemeDark;
      noteThemes[4] = noteThemeDark;
      selectedNoteTheme(noteThemeDark);
    }

    return noteThemes;
  }

//Save Note
  void saveNote() {
    noteCubit.saveNote(noteModel);
    _clearText();
    _navigateToHome();
  }

  NoteModel get noteModel => NoteModel(
        noteId: noteKey as String,
        title: titleTextController.text,
        body: contentTextController.text,
        noteTheme: noteCubit.state.noteTheme,
        category: noteCubit.state.category,
        created: created,
      );
  DateTime get created => DateTime.now();
  //Cancel Note
  void cancelNote() {
    _navigateToHome();
  }
}
