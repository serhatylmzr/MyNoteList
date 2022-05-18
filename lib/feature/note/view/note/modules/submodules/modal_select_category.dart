part of '../../note_view.dart';

void _buildBottomSheet(BuildContext ctx, NoteViewModel viewModel) {
  showBottomSheet(
    backgroundColor: ctx.theme.backgroundColor,
    context: ctx,
    shape: _buildShape(ctx),
    builder: (context) => SizedBox(
      height: context.dynamicHeight(0.35),
      width: context.width,
      child: _buildColumn(context, viewModel),
    ),
  );
}

Column _buildColumn(BuildContext context, NoteViewModel viewModel) {
  return Column(
    children: [
      context.emptySizedHeightBoxNormal,
      _buildHeader(context),
      context.emptySizedHeightBoxLow,
      const Divider(),
      context.emptySizedHeightBoxNormal,
      _buildBody(viewModel),
    ],
  );
}

Expanded _buildBody(NoteViewModel viewModel) {
  return Expanded(
    child: ListView.builder(
        itemCount: viewModel.categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = viewModel.categories[index];
          return _ItemCategoryWidget(
              color: Color(category.color),
              text: category.category,
              onTap: () => {
                    viewModel.selectedCategory(category),
                    Navigator.pop(context)
                  });
        }),
  );
}

LocaleText _buildHeader(BuildContext context) {
  return LocaleText(
      text: LocaleKeys.notes_category_select_category,
      style:
          context.textTheme.headline2!.copyWith(fontWeight: FontWeight.w500));
}

RoundedRectangleBorder _buildShape(BuildContext context) {
  final radius = Radius.circular(context.regularRadius);
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
  );
}
