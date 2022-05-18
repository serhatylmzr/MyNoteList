part of '../note_view.dart';

class _CategoryWidget extends StatelessWidget {
  final NoteViewModel viewModel;

  const _CategoryWidget({Key? key, required this.viewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.07),
      width: context.width,
      decoration: _buildBoxDecoration(context, context.theme.backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryTitle(context),
          Container(
            margin: context.paddingRightNormal,
            alignment: Alignment.center,
            height: context.dynamicHeight(0.05),
            width: 170,
            decoration: _buildBoxDecoration(context, context.theme.cardColor),
            child: _buildCategoryButton(context),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context, Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: context.veryLowCircularRadius,
    );
  }

  InkWell _buildCategoryButton(BuildContext context) {
    return InkWell(
      borderRadius: context.lowCircularRadius,
      onTap: () => _buildBottomSheet(context, viewModel),
      child: Padding(
        padding: context.paddingSymmetricLowHorizontal,
        child: BlocBuilder<NoteCubit, NoteState>(
          builder: (context, state) {
            final category = state.category;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CategoryCircleWidget(color: Color(category.color)),
                LocaleText(
                    text: category.category,
                    style: context.textTheme.headline3),
                const Icon(Icons.expand_more)
              ],
            );
          },
        ),
      ),
    );
  }

  Padding _buildCategoryTitle(BuildContext context) {
    return Padding(
      padding: context.paddingLeftMedium,
      child: LocaleText(
        text: LocaleKeys.notes_category_category,
        style: context.textTheme.headline3,
      ),
    );
  }
}
