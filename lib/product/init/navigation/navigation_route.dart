import 'package:flutter/material.dart';
import '../../../feature/onboard/view/onboard_view.dart';
import '../../../feature/note/view/noteList/note_list_view.dart';
import '../../../feature/splash/view/splash_view.dart';
import '../../../feature/note/view/note/note_view.dart';
import 'animation/fade_navigate.dart';
import 'navigation_enums.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (NavigationEnums.home.normalValue(args.name)) {
      case NavigationEnums.home:
        return _normalNavigate(const NoteListView());
      case NavigationEnums.splash:
        return _fadeRouteNavigate(const SplashView());
      case NavigationEnums.addNote:
        return _normalNavigate(const NoteView());
      case NavigationEnums.noteDetail:
        return _normalNavigate(const NoteView(), settings: args);
      case NavigationEnums.onboard:
        return _normalNavigate(const OnboardView());
      default:
        throw Exception('$this not found');
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget,
      {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: isFullScreen);
  }

  PageRoute _fadeRouteNavigate(Widget widget, {RouteSettings? settings}) {
    return FadeRoute(page: widget, settings: settings);
  }
}
