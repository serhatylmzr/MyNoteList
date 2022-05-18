import 'package:flutter/material.dart';

part 'dark_color.dart';
part 'light_color.dart';

@immutable
class _AppColors {
  final Color white = const Color(0xffffffff);
  final Color silverSand = const Color(0xffC2C2C2);
  final Color davyGrey = const Color(0xff555555);
  final Color mirage = const Color(0xff171C26);
  final Color gunMetal = const Color(0xff283040);
  final Color ultraMarineBlue = const Color(0xff3369FF);
  final Color windowsBlue = const Color(0xff367FC0);
  final Color flamePea = const Color(0xffDD4B39);
  final Color fandango = const Color(0xffB3327E);
  final Color quillGrey = const Color(0xffD4D4D4);
  final Color mountainMist = const Color(0xff979797);
  final Color whiteSmoke = const Color(0xffF6F6F6);
  final Color pastelBlue = const Color(0xffA6BDFF);
  final Color salmonPink = const Color(0xffFD7E77);
  final Color santaGrey = const Color(0xff9CA5B2);
  final Color brinkPink = const Color(0xffFF5B7F);
  final Color orangeyYellow = const Color(0xffFEB52B);
  final Color rubyRed = const Color(0xffFF1818);
  final Color bitterSweet = const Color(0xffFF6363);
}

abstract class IColors {
  _AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? backgroundColor;
  Color? appBarColor;
  ColorScheme? colorScheme;
  Color? textColor;
  Color? textColor2;
  Color? textColor3;
  Color? iconColor;
  Color? cardColor;
  Color? canvasColor;
  Brightness? brightness;
}
