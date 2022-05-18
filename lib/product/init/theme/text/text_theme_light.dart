import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import 'text_theme.dart';

class TextThemeLight implements ITextTheme {
  @override
  late final TextTheme data;

  @override
  String? fontFamily;

  @override
  TextStyle? bodyText1 =
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400);

  @override
  TextStyle? bodyText2 =
      const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400);

  @override
  TextStyle? headline1 =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w700);

  @override
  TextStyle? headline2 =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

  @override
  TextStyle? headline3 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  @override
  TextStyle? headline4 =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  @override
  TextStyle? headline5 =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w500);

  @override
  TextStyle? headline6 =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w500);

  @override
  TextStyle? subtitle1 = const TextStyle(fontSize: 16.0);

  @override
  TextStyle? subtitle2 = const TextStyle(fontSize: 14.0);

  @override
  final Color? primaryColor;

  @override
  final Color? secondaryColor;

  TextThemeLight(this.primaryColor, this.secondaryColor) {
    fontFamily = ApplicationConstants.fontFamily;
    data = TextTheme(
            headline1: headline1,
            headline2: headline2,
            headline3: headline3,
            headline4: headline4,
            headline5: headline5,
            headline6: headline6,
            bodyText1: bodyText1,
            bodyText2: bodyText2,
            subtitle1: subtitle1,
            subtitle2: subtitle2)
        .apply(displayColor: primaryColor);
  }
}
