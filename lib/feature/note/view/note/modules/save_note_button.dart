part of '../note_view.dart';

class _SaveNoteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveNoteButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _size = 30;
    return IconButton(
      padding: context.paddingRightHigh,
      onPressed: onPressed,
      icon: const Icon(
        Icons.note_alt_rounded,
        size: _size,
      ),
    );
  }
}
