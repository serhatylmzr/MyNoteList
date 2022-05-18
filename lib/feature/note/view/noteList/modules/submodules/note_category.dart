part of '../../note_list_view.dart';

class _NoteCategoryContainer extends StatelessWidget {
  final String text;
  final int color;
  final int textColor;
  const _NoteCategoryContainer(
      {Key? key,
      required this.text,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: context.paddingSymmetricDynamic(4.0, 15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(color), width: 1.0),
          borderRadius: context.veryLowCircularRadius,
        ),
        alignment: Alignment.centerRight,
        child: LocaleText(
          text: text,
          style: context.textTheme.bodyText1?.copyWith(color: Color(textColor)),
        ));
  }
}
