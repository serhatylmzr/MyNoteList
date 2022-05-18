part of 'note_cubit.dart';

class NoteState extends Equatable {
  const NoteState({
    this.noteList,
    this.isGrid = true,
    required this.noteTheme,
    required this.category,
  });
  final List<NoteModel>? noteList;
  final bool isGrid;
  final NoteThemeModel noteTheme;
  final CategoryModel category;

  @override
  List<Object?> get props => [noteList, isGrid, noteTheme, category];

  NoteState copyWith(
      {List<NoteModel>? noteList,
      bool? isGrid,
      NoteThemeModel? noteTheme,
      CategoryModel? category,
      Color? colorCategory}) {
    return NoteState(
      noteList: noteList ?? this.noteList,
      isGrid: isGrid ?? this.isGrid,
      noteTheme: noteTheme ?? this.noteTheme,
      category: category ?? this.category,
    );
  }
}
