import 'package:flutter/material.dart';

extension ColorExtension on String? {
  Color get stringToColor => Color(int.parse(this!));
  bool get isColor => this!.contains('0xff') && this!.length == 10;
}
