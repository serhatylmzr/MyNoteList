part of '../onboard_view.dart';

class _SkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _SkipButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.theme.canvasColor,
      child: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
