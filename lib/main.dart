import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product/init/theme/app_theme.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_manager.dart';
import 'feature/note/cubit/note_cubit.dart';
import 'feature/setting/cubit/setting_cubit.dart';
import 'feature/setting/service/setting_cache_manager.dart';
import 'feature/splash/view/splash_view.dart';
import 'product/constants/app_constants.dart';
import 'product/init/app/app_init.dart';
import 'product/init/navigation/navigation_route.dart';

Future<void> main() async {
  await AppInitialize().initBeforeAppStart();
  SettingCacheManager cacheManager = SettingCacheManager();
  await cacheManager.init();
  var themeMode = cacheManager.getTheme();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NoteCubit>(
          create: (context) => NoteCubit(),
        ),
        BlocProvider<SettingCubit>(
          create: (context) => SettingCubit(themeMode),
        ),
      ],
      child: EasyLocalization(
        saveLocale: true,
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.langAssetPath,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: ApplicationConstants.appTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.watch<SettingCubit>().state.locale,
      home: const SplashView(),
      onGenerateRoute: NavigationRoute().generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      theme: context.watch<SettingCubit>().state.darkMode
          ? ThemeManager.createTheme(AppThemeDark())
          : ThemeManager.createTheme(AppThemeLight()),
    );
  }
  // child
}
