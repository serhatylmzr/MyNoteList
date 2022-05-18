import '../../constants/color_constants.dart';
import '../../constants/image_constants.dart';

import '../../../feature/note/model/note_theme/note_theme_model.dart';

class NoteThemeManager {
  static NoteThemeManager? _instance;
  static NoteThemeManager get instance {
    return _instance ??= NoteThemeManager._init();
  }

  NoteThemeManager._init();

  final imageThemeGalaxy = NoteThemeModel(
      background: ImageConstants.instance.pngPath.galaxy,
      textColor: NoteThemeColors.textColorWhite);
  final imageThemeColorArt = NoteThemeModel(
      background: ImageConstants.instance.pngPath.colorArt,
      textColor: NoteThemeColors.textColorBlack);
  final imageThemeSkyNight = NoteThemeModel(
      background: ImageConstants.instance.pngPath.skyNight,
      textColor: NoteThemeColors.textColorWhite);
  final colorThemeDark = NoteThemeModel(
      background: NoteThemeColors.gunMetal,
      textColor: NoteThemeColors.textColorWhite);
  final colorThemeLight = NoteThemeModel(
      background: NoteThemeColors.whiteSmoke,
      textColor: NoteThemeColors.textColorBlack);
  final colorThemeGreen = NoteThemeModel(
      background: NoteThemeColors.lightGreen,
      textColor: NoteThemeColors.textColorBlack);
  final colorThemeRed = NoteThemeModel(
      background: NoteThemeColors.lightRed,
      textColor: NoteThemeColors.textColorBlack);
  final colorThemeBlue = NoteThemeModel(
      background: NoteThemeColors.lightBlue,
      textColor: NoteThemeColors.textColorBlack);
  final colorThemeYellow = NoteThemeModel(
      background: NoteThemeColors.lightYellow,
      textColor: NoteThemeColors.textColorBlack);

  late final List<NoteThemeModel> noteThemes = [
    imageThemeGalaxy,
    imageThemeColorArt,
    imageThemeSkyNight,
    colorThemeYellow,
    colorThemeDark,
    colorThemeGreen,
    colorThemeRed,
    colorThemeBlue,
  ];
}
