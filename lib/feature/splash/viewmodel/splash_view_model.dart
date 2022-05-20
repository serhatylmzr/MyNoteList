import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/constants/image_constants.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../product/init/navigation/navigation_enums.dart';
import '../../setting/cubit/setting_cubit.dart';
import '../../setting/service/setting_cache_manager.dart';

class SplashViewModel extends BaseViewModel {
  late AnimationController animationController;
  late TickerProvider page;
  final ImageConstants imageConstants = ImageConstants.instance;
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  late final settingCubit = BlocProvider.of<SettingCubit>(context);
  void init() {
    animationController = AnimationController(vsync: page);
  }

  void onDispose() {
    animationController.dispose();
  }

  TickerProvider setTicker(TickerProvider page) => this.page = page;

  void cacheControl() async {
    settingCubit.changeLang(context.locale);
    SettingCacheManager _cacheManager = SettingCacheManager();
    final bool initFirstApp = await _cacheManager.getInit();
    await Future.delayed(const Duration(seconds: 1));
    if (initFirstApp == true) {
      navigateToHome();
    } else {
      navigateToOnboard();
    }
  }

  void navigateToHome() {
    navigationManager.navigateToPageClear(path: NavigationEnums.home.rawValue);
  }

  void navigateToOnboard() {
    navigationManager.navigateToPageClear(
        path: NavigationEnums.onboard.rawValue);
  }
}
