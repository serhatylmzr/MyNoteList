part of '../../setting_view.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: LocaleText(
        text: LocaleKeys.dialogButtons_close,
        style: context.textTheme.button,
      ),
    );
  }
}
