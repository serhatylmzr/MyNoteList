part of 'color_theme.dart';

class LightColors implements IColors {
  @override
  final _AppColors colors = _AppColors();

  @override
  late final Color? appBarColor;

  @override
  late final Brightness? brightness;

  @override
  late final ColorScheme? colorScheme;

  @override
  late final Color? scaffoldBackgroundColor;

  @override
  late final Color? textColor;

  @override
  Color? iconColor;

  @override
  late final Color? textColor2;

  @override
  late final Color? textColor3;

  @override
  late final Color? backgroundColor;

  @override
  late final Color? cardColor;
  @override
  late final Color? canvasColor;

  LightColors() {
    appBarColor = colors.whiteSmoke;
    backgroundColor = colors.white;
    scaffoldBackgroundColor = colors.white;
    iconColor = colors.white;
    textColor = colors.silverSand;
    textColor2 = colors.davyGrey;
    cardColor = colors.whiteSmoke;
    iconColor = colors.davyGrey;
    canvasColor = colors.orangeyYellow;
    brightness = Brightness.light;
    colorScheme = const ColorScheme.light().copyWith(
      secondaryContainer: colors.rubyRed,
      onSecondaryContainer: colors.bitterSweet,
    );
  }
}
