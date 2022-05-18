import 'package:flutter/material.dart';
import '../../extension/color_extension.dart';

BoxDecoration buildBoxDecoration(String? background) {
  final radius = BorderRadius.circular(10);
  const shape = BoxShape.rectangle;
  if (background.isColor) {
    return BoxDecoration(
      borderRadius: radius,
      shape: shape,
      color: (background ?? '').stringToColor,
    );
  } else {
    return BoxDecoration(
      borderRadius: radius,
      shape: shape,
      image: DecorationImage(
          image: AssetImage(background ?? ''), fit: BoxFit.fill),
    );
  }
}
