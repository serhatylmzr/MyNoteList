import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text;
  TextStyle? style;
  CustomText({Key? key, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: style,
    );
  }
}
