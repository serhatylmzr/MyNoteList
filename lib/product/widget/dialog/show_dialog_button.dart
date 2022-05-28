import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

void buildShowDialog(BuildContext context, Widget child) {
  const Color _barrierColor = Colors.black54;
  const Duration _transitionDuration = Duration(milliseconds: 500);
  showGeneralDialog(
    context: context,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: _barrierColor,
    pageBuilder: (context, animationFirst, animationSecond) =>
        _buildDialog(context, child),
    barrierDismissible: true,
    transitionBuilder: _buildAnimation,
    transitionDuration: _transitionDuration,
  );
}

Dialog _buildDialog(BuildContext context, Widget child) {
  return Dialog(
      alignment: Alignment.center,
      backgroundColor: context.theme.cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: child);
}

Widget _buildAnimation(context, animationFirst, animationSecond, child) {
  var curve = Curves.easeInOut.transform(animationFirst.value);
  return Transform.scale(
    scale: curve,
    child: child,
  );
}
