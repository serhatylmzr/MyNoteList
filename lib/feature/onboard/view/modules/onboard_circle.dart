part of '../onboard_view.dart';

class _OnBoardCircle extends StatelessWidget {
  final bool isSelected;

  const _OnBoardCircle({Key? key, required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor:
            context.theme.iconTheme.color?.withOpacity(isSelected ? 1 : 0.2),
        radius: isSelected ? context.width * 0.015 : context.width * 0.01,
      ),
    );
  }
}
