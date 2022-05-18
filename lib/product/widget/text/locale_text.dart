import 'package:flutter/material.dart';
import '../../../core/extensions/string_extension.dart';

// ignore: must_be_immutable
class LocaleText extends StatelessWidget {
  String? text;
  TextStyle? style;
  LocaleText({Key? key, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text?.locale ?? '',
      style: style,
    );
  }
}
