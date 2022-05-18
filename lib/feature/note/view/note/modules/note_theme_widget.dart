part of '../note_view.dart';

class _NoteThemeWidget extends StatelessWidget {
  final NoteViewModel viewModel;
  const _NoteThemeWidget({Key? key, required this.viewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.05),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(width: context.dynamicWidth(0.02));
          },
          itemCount: viewModel.noteThemes.length,
          itemBuilder: (BuildContext context, int index) {
            final _noteTheme = viewModel.noteThemes[index];
            return _noteThemeItem(_noteTheme);
          }),
    );
  }

  _NoteThemeCircleWidget _noteThemeItem(noteTheme) {
    return _NoteThemeCircleWidget(
        noteTheme: noteTheme,
        onTap: () => viewModel.selectedNoteTheme(noteTheme));
  }
}
