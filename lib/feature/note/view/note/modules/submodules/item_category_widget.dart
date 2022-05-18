part of '../../note_view.dart';

class _ItemCategoryWidget extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onTap;

  const _ItemCategoryWidget(
      {Key? key, required this.color, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding: context.paddingSymmetricNormalHorizontal,
        margin: context.paddingBottomNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _CategoryCircleWidget(
                  color: color,
                ),
                context.emptySizedWidthBoxNormal,
                LocaleText(text: text, style: context.textTheme.headline3)
              ],
            ),
            BlocBuilder<NoteCubit, NoteState>(
                builder: (context, state) => (state.category.category == text)
                    ? const Icon(Icons.check)
                    : Container()),
          ],
        ),
      ),
    );
  }
}
