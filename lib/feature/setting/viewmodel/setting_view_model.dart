import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/lang/language_manager.dart';
import '../cubit/setting_cubit.dart';

class SettingViewModel extends BaseViewModel {
  final LanguageManager _languageManager = LanguageManager.instance;
  List<Locale> locales = [];

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  late final settingCubit = BlocProvider.of<SettingCubit>(context);

  void init() {
    locales = _languageManager.supportedLocales;
  }

  void onDispose() {}

  void changeLanguage(Locale locale) {
    context.setLocale(locale);
    settingCubit.changeLang(locale);
    Navigator.pop(context);
  }

  void changeTheme() {}
}
