import 'package:flutter/material.dart';

import 'colors/color_theme.dart';
import 'text/text_theme.dart';
import 'text/text_theme_dark.dart';
import 'text/text_theme_light.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;
}

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        fontFamily: theme.textTheme.fontFamily,
        textTheme: theme.textTheme.data,
        backgroundColor: theme.colors.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: theme.colors.appBarColor,
          iconTheme: IconThemeData(color: theme.colors.iconColor, size: 24),
        ),
        scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
        listTileTheme: ListTileThemeData(
          iconColor: theme.colors.iconColor,
        ),
        canvasColor: theme.colors.canvasColor,
        iconTheme: IconThemeData(color: theme.colors.iconColor, size: 24),
        cardColor: theme.colors.cardColor,
        bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
        brightness: theme.colors.colorScheme?.brightness,
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: theme.colors.iconColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                onPrimary: theme.colors.colorScheme?.onSecondary)),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: theme.textTheme.subtitle2,
            hintStyle: theme.textTheme.headline3),
        colorScheme: theme.colors.colorScheme,
        dividerColor: theme.colors.textColor,
      );
}

class AppThemeDark extends ITheme {
  @override
  late final ITextTheme textTheme;
  AppThemeDark() {
    textTheme = TextThemeDark(colors.textColor, colors.textColor2);
  }

  @override
  IColors get colors => DarkColors();
}

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;

  AppThemeLight() {
    textTheme = TextThemeLight(colors.textColor2, colors.textColor);
  }

  @override
  IColors get colors => LightColors();
}
