import '../../core/extensions/string_extension.dart';

class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._init();
  }

  ImageConstants._init();

  final _PNGPath pngPath = _PNGPath();
  final _LottiePath lottiePath = _LottiePath();
  final _SVGPath svgPath = _SVGPath();
}

class _SVGPath {
  final String addNote = 'onboard_add_note'.toSVG;
  final String noteList = 'onboard_note_list'.toSVG;
  final String takingNotes = 'taking_notes'.toSVG;
  final String noteNotFound = 'note_not_found'.toSVG;
  final String drawerNotebook = 'drawer_notebook'.toSVG;
}

class _LottiePath {
  final String loading = 'splash_loading'.toLottie;
}

class _PNGPath {
  final String appLogo = 'ic_launcher'.toPNG;
  final String skyNight = 'sky_night'.toPNG;
  final String notePage = 'note_page'.toPNG;
  final String colorArt = 'color_art'.toPNG;
  final String galaxy = 'galaxy'.toPNG;
}
