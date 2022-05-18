part of '../setting_view.dart';

class _LanguageDialog extends StatelessWidget {
  final SettingViewModel viewModel;
  const _LanguageDialog({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: context.theme.cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: SizedBox(
        height: context.dynamicHeight(0.3),
        width: context.dynamicWidth(0.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageHeader(context),
            Expanded(
              child: _buildLanguageList(),
            ),
            context.emptySizedHeightBoxNormal,
          ],
        ),
      ),
    );
  }

  ListView _buildLanguageList() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: viewModel.locales.length,
        itemBuilder: (BuildContext context, int index) {
          final _locale = viewModel.locales[index];
          final Color? _selectedColor =
              context.locale == _locale ? context.theme.canvasColor : null;
          return Padding(
            padding: context.paddingSymmetricMediumHorizontal,
            child: Column(
              children: [
                ListTile(
                  iconColor:
                      _selectedColor ?? context.theme.listTileTheme.iconColor,
                  onTap: () {
                    viewModel.changeLanguage(_locale);
                  },
                  leading: const Icon(
                    Icons.arrow_left_outlined,
                  ),
                  title: Center(
                    child: LocaleText(
                      text: _locale.languageCode.getLangFullName,
                      style:
                          context.textTheme.bodyText1?.copyWith(fontSize: 14),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right_outlined,
                  ),
                ),
                _buildLanguageDivider(context, _selectedColor),
              ],
            ),
          );
        });
  }

  Divider _buildLanguageDivider(BuildContext context, Color? _selectedColor) {
    const double thickness = 0.5;
    return Divider(
      color: _selectedColor ?? context.theme.dividerColor,
      thickness: thickness,
    );
  }

  Column _buildLanguageHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingTopNormal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageIcon(context),
              _buildLanguageTitle(context),
            ],
          ),
        ),
        _buildLanguageDescription(context),
      ],
    );
  }

  Padding _buildLanguageDescription(BuildContext context) {
    return Padding(
      padding: context.paddingSymmetricNormalVertical,
      child: LocaleText(
        text: LocaleKeys.profilePage_language_hintText,
      ),
    );
  }

  LocaleText _buildLanguageTitle(BuildContext context) {
    return LocaleText(
      text: LocaleKeys.profilePage_language_title,
      style:
          context.textTheme.headline2?.copyWith(fontWeight: FontWeight.normal),
    );
  }

  Padding _buildLanguageIcon(BuildContext context) {
    return Padding(
      padding: context.paddingRightNormal,
      child: const Icon(Icons.language),
    );
  }
}
