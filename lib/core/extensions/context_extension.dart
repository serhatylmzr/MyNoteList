import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get keyboardSize => MediaQuery.of(this).viewInsets.bottom;
  bool get isKeyBoardOpen => keyboardSize > 0;
}

extension MediaQueryExtension on BuildContext {
  //Values
  double get lowValue => 0.01;
  double get normalValue => 0.02;
  double get mediumValue => 0.04;
  double get highValue => 0.1;

  //Height
  double get height => mediaQuery.size.height;
  double get lowHeightValue => height * lowValue;
  double get normalHeightValue => height * normalValue;
  double get mediumHeightValue => height * mediumValue;
  double get highHeightValue => height * highValue;
  double dynamicHeight(double value) => height * value;

  //Width
  double get width => mediaQuery.size.width;
  double get lowWidthValue => width * lowValue;
  double get normalWidthValue => width * normalValue;
  double get mediumWidthValue => width * mediumValue;
  double get highWidthValue => width * highValue;
  double dynamicWidth(double value) => width * value;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  InputDecorationTheme get inputDecoration => theme.inputDecorationTheme;
  ColorScheme? get buttonColorScheme => theme.buttonTheme.colorScheme;
  TextTheme get primaryTextTheme => theme.primaryTextTheme;
  DialogTheme get dialogTheme => theme.dialogTheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowHeightValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalHeightValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumHeightValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highHeightValue);
}

extension PaddingExtension on BuildContext {
  //Symetric Paddings Vertical
  EdgeInsets get paddingSymmetricLowVertical =>
      EdgeInsets.symmetric(vertical: lowHeightValue);
  EdgeInsets get paddingSymmetricNormalVertical =>
      EdgeInsets.symmetric(vertical: normalHeightValue);
  EdgeInsets get paddingSymmetricMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumHeightValue);
  EdgeInsets get paddingSymmetricHighVertical =>
      EdgeInsets.symmetric(vertical: highHeightValue);
  EdgeInsets paddingSymmetricDynamic(double vertical, double horizontal) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  // Symetric Padding Horizontal
  EdgeInsets get paddingSymmetricLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowHeightValue);
  EdgeInsets get paddingSymmetricNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalHeightValue);
  EdgeInsets get paddingSymmetricMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumHeightValue);
  EdgeInsets get paddingSymmetricHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highHeightValue);

  //Only Bottom Padding
  EdgeInsets get paddingBottomLow => EdgeInsets.only(bottom: lowHeightValue);
  EdgeInsets get paddingBottomNormal =>
      EdgeInsets.only(bottom: normalHeightValue);
  EdgeInsets get paddingBottomMedium =>
      EdgeInsets.only(bottom: mediumHeightValue);
  EdgeInsets get paddingBottomHigh => EdgeInsets.only(bottom: highHeightValue);
  EdgeInsets paddingBottomDynamic(double bottom) =>
      EdgeInsets.only(bottom: height * bottom);

  //Only Top Padding
  EdgeInsets get paddingTopLow => EdgeInsets.only(top: lowHeightValue);
  EdgeInsets get paddingTopNormal => EdgeInsets.only(top: normalHeightValue);
  EdgeInsets get paddingTopMedium => EdgeInsets.only(top: mediumHeightValue);
  EdgeInsets get paddingTopHigh => EdgeInsets.only(top: highHeightValue);
  EdgeInsets paddingTopDynamic(double top) =>
      EdgeInsets.only(top: height * top);

  //Only Left Padding
  EdgeInsets get paddingLeftLow => EdgeInsets.only(left: lowWidthValue);
  EdgeInsets get paddingLeftNormal => EdgeInsets.only(left: normalWidthValue);
  EdgeInsets get paddingLeftMedium => EdgeInsets.only(left: mediumWidthValue);
  EdgeInsets get paddingLeftHigh => EdgeInsets.only(left: highWidthValue);
  EdgeInsets paddingLeftDynamic(double left) =>
      EdgeInsets.only(left: width * left);

  //Only Right Padding
  EdgeInsets get paddingRighttLow => EdgeInsets.only(right: lowWidthValue);
  EdgeInsets get paddingRightNormal => EdgeInsets.only(right: normalWidthValue);
  EdgeInsets get paddingRightMedium => EdgeInsets.only(right: mediumWidthValue);
  EdgeInsets get paddingRightHigh => EdgeInsets.only(right: highWidthValue);
  EdgeInsets paddingRightDynamic(double right) =>
      EdgeInsets.only(left: width * right);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension RadiusExtension on BuildContext {
  double get veryLowRadius => 10;
  double get lowRadius => 15;
  double get mediumRadius => 30;
  double get regularRadius => 50;
  double get heighRadius => 70;
  double get ultraRadius => 90;

  double dynamicRadius(double value) => value;
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
  Duration get mediumDuration => const Duration(seconds: 3);
}

extension ExpandedExtension on BuildContext {
  Expanded dynamicExpanded(int flex, Widget child) =>
      Expanded(flex: flex, child: child);
  Spacer get spacer => const Spacer();
  Spacer get lowSpacer => const Spacer(flex: 2);
  Spacer get mediumSpacer => const Spacer(flex: 3);
  Spacer get highSpacer => const Spacer(flex: 4);
  Spacer dynamicSpacer(int flex) => Spacer(flex: flex);
}

extension SizedBoxExtension on BuildContext {
  Widget get emptySizedWidthBoxLow => SizedBox(width: lowWidthValue);
  Widget get emptySizedWidthBoxNormal => SizedBox(width: normalWidthValue);
  Widget get emptySizedWidthBoxMedium => SizedBox(width: mediumWidthValue);
  Widget get emptySizedWidthBoxHigh => SizedBox(width: highWidthValue);

  Widget get emptySizedHeightBoxLow => SizedBox(height: lowHeightValue);
  Widget get emptySizedHeightBoxNormal => SizedBox(height: normalHeightValue);
  Widget get emptySizedHeightBoxMedium => SizedBox(height: mediumHeightValue);
  Widget get emptySizedHeightBoxHigh => SizedBox(height: highHeightValue);
}

extension BorderExtension on BuildContext {
  BorderRadius get veryLowCircularRadius =>
      BorderRadius.circular(veryLowRadius);
  BorderRadius get lowCircularRadius => BorderRadius.circular(lowRadius);
  BorderRadius get mediumCircularRadius => BorderRadius.circular(mediumRadius);
  BorderRadius dynamicCircularRadius(double value) =>
      BorderRadius.circular(value);
}
