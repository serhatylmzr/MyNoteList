import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../product/constants/image_constants.dart';
import '../../../product/init/lang/locale_keys.g.dart';
import '../../../product/init/navigation/navigation_enums.dart';
import '../../setting/cubit/setting_cubit.dart';
import '../../setting/service/setting_cache_manager.dart';
import '../model/onboard_model.dart';

class OnboardViewModel extends BaseViewModel {
  List<OnBoardModel> onBoardItems = [];
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  late final settingCubit = BlocProvider.of<SettingCubit>(context);

  void onDispose() {}

  void init() {
    initOnboardItems();
  }

  void changeLoading() {
    settingCubit.changeLoading();
  }

  void changeCurrentIndex(int value) {
    settingCubit.changeCurrentIndex(value);
  }

  Future<void> completeToOnBoard() async {
    SettingCacheManager _cacheManager = SettingCacheManager();
    await _cacheManager.cacheInit(true);

    if (navigationManager.navigatorKey.currentState!.canPop()) {
      navigationManager.navigatorKey.currentState!.pop();
    } else {
      navigateToSplash();
    }
  }

  void navigateToSplash() {
    navigationManager.navigateToPageClear(
        path: NavigationEnums.splash.rawValue);
  }

  void initOnboardItems() {
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onboardPage_page1_title,
        LocaleKeys.onboardPage_page1_description,
        ImageConstants.instance.svgPath.addNote));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onboardPage_page2_title,
        LocaleKeys.onboardPage_page2_description,
        ImageConstants.instance.svgPath.noteList));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onboardPage_page3_title,
        LocaleKeys.onboardPage_page3_description,
        ImageConstants.instance.svgPath.takingNotes));
  }
}
