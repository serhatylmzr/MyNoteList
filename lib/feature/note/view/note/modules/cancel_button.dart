part of '../note_view.dart';

class _CancelNoteButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _CancelNoteButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _size = 25;
    return IconButton(
      padding: context.paddingLeftMedium,
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_outlined,
        size: _size,
      ),
    );
  }
}
