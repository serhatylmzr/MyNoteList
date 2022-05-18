part of 'color_theme.dart';

class DarkColors implements IColors {
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

  DarkColors() {
    appBarColor = colors.gunMetal;
    backgroundColor = colors.mirage;
    scaffoldBackgroundColor = colors.mirage;
    iconColor = colors.silverSand;
    textColor = colors.white;
    textColor2 = colors.silverSand;
    textColor3 = colors.davyGrey;
    cardColor = colors.gunMetal;
    iconColor = colors.white;
    canvasColor = colors.ultraMarineBlue;
    brightness = Brightness.dark;
    colorScheme = const ColorScheme.dark().copyWith(
      secondaryContainer: colors.rubyRed,
      onSecondaryContainer: colors.bitterSweet,
    );
  }
}
