import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../product/init/lang/language_extension.dart';
import '../../../product/constants/app_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/widget/dialog/show_dialog_button.dart';
import '../cubit/setting_cubit.dart';
import '../viewmodel/setting_view_model.dart';
import '../../../product/constants/image_constants.dart';
import '../../../product/widget/text/locale_text.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/init/lang/locale_keys.g.dart';
part 'modules/app_logo_widget.dart';
part 'modules/theme_switch.dart';
part 'modules/language_dialog.dart';
part 'modules/privacy_dialog.dart';
part 'modules/collaboration_dialog.dart';
part 'modules/drawer_image_widget.dart';
part 'modules/submodules/close_text_button.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingViewModel>(
        viewModel: SettingViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onDispose: (model) {
          model.onDispose();
        },
        onPageBuilder: (context, _viewModel) =>
            _buildDrawer(context, _viewModel));
  }
}

Drawer _buildDrawer(BuildContext context, SettingViewModel _viewModel) {
  return Drawer(
    backgroundColor: context.theme.cardColor,
    child: SafeArea(
      child: _buildListView(context, _viewModel),
    ),
  );
}

ListView _buildListView(BuildContext context, SettingViewModel _viewModel) {
  return ListView(
    padding: context.paddingBottomLow,
    children: <Widget>[
      const _AppLogoWidget(),
      const Divider(),
      _buildLanguage(context, _viewModel),
      _buildTheme(context, _viewModel),
      _buildPrivacy(context, _viewModel),
      _buildLicence(context, _viewModel),
      _buildApplicationTour(context, _viewModel),
      _buildCollaboration(context, _viewModel),
      const _DrawerImageWidget()
    ],
  );
}

ListTile _buildTheme(BuildContext context, SettingViewModel _viewModel) {
  return ListTile(
    leading: const Icon(Icons.dark_mode_outlined),
    title: _buildTitle(context, LocaleKeys.profilePage_theme_title_dark),
    trailing: _ThemeSwitch(
      viewModel: _viewModel,
    ),
  );
}

ListTile _buildLanguage(BuildContext context, SettingViewModel _viewModel) {
  return ListTile(
    leading: const Icon(Icons.language),
    title: _buildTitle(context, LocaleKeys.profilePage_language_title),
    trailing: Padding(
      padding: context.paddingRightNormal,
      child: LocaleText(
          text: context
              .watch<SettingCubit>()
              .state
              .locale
              ?.languageCode
              .getLangFullName),
    ),
    onTap: () =>
        buildShowDialog(context, _LanguageDialog(viewModel: _viewModel)),
    //trailing: ,
  );
}

ListTile _buildPrivacy(BuildContext context, SettingViewModel viewModel) {
  return ListTile(
      leading: const Icon(Icons.privacy_tip_outlined),
      title: _buildTitle(context, LocaleKeys.profilePage_privacyPolicy_title),
      onTap: () =>
          buildShowDialog(context, _PrivacyDialog(viewModel: viewModel)));
}

ListTile _buildLicence(BuildContext context, SettingViewModel viewModel) {
  return ListTile(
    leading: const Icon(
      Icons.info_outlined,
    ),
    title: _buildTitle(context, LocaleKeys.profilePage_licences_title),
    onTap: () => showLicensePage(
        context: context,
        applicationName: ApplicationConstants.appTitle,
        applicationVersion: ApplicationConstants.appVersion),
  );
}

ListTile _buildApplicationTour(
    BuildContext context, SettingViewModel viewModel) {
  return ListTile(
      leading: const Icon(Icons.arrow_right_alt_outlined),
      title: _buildTitle(context, LocaleKeys.profilePage_applicationTour_title),
      onTap: () => viewModel.navigateToOnboard());
}

ListTile _buildCollaboration(BuildContext context, SettingViewModel viewModel) {
  return ListTile(
      leading: const Icon(Icons.handshake_outlined),
      title: _buildTitle(context, LocaleKeys.profilePage_collaboration_title),
      onTap: () =>
          buildShowDialog(context, _CollaborationDialog(viewModel: viewModel)));
}

LocaleText _buildTitle(BuildContext context, String title) =>
    LocaleText(text: title, style: context.textTheme.headline4);
