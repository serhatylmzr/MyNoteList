part of '../../note_view.dart';

class _NoteThemeCircleWidget extends StatelessWidget {
  final NoteThemeModel noteTheme;
  final VoidCallback onTap;

  const _NoteThemeCircleWidget(
      {Key? key, required this.noteTheme, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.highWidthValue,
        width: context.highWidthValue,
        decoration: _buildBox(),
        child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) =>
                state.noteTheme.background == noteTheme.background
                    ? Icon(Icons.check, color: Color(state.noteTheme.textColor))
                    : Container()),
      ),
    );
  }

  BoxDecoration _buildBox() {
    if (noteTheme.background.isColor == false) {
      return BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(noteTheme.background), fit: BoxFit.fill));
    } else {
      return BoxDecoration(
          shape: BoxShape.circle, color: noteTheme.background.stringToColor);
    }
  }
}
