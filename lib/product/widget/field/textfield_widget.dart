import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final TextStyle? style;
  final String? hintText;
  final Color? cursorColor;

  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.maxLines,
      this.style,
      this.hintText,
      this.cursorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: context.theme.cardColor.withOpacity(0.0),
        borderRadius: BorderRadius.circular(context.veryLowRadius),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: cursorColor ?? context.theme.iconTheme.color,
        maxLines: maxLines ?? 1,
        style: style,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: context.paddingLow,
            hintStyle: style),
      ),
    );
  }
}
