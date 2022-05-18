enum NavigationEnums {
  home,
  login,
  addNote,
  noteDetail,
  splash,
  onboard,
}

extension NavigationConstantsValue on NavigationEnums {
  String get rawValue {
    switch (this) {
      case NavigationEnums.home:
        return '/home';
      case NavigationEnums.login:
        return '/login';
      case NavigationEnums.onboard:
        return '/onboard';
      case NavigationEnums.splash:
        return '/splash';
      case NavigationEnums.addNote:
        return '/addNote';
      case NavigationEnums.noteDetail:
        return '/noteDetail';
    }
  }

  NavigationEnums normalValue(String? val) {
    switch (val) {
      case '/splash':
        return NavigationEnums.splash;
      case '/home':
        return NavigationEnums.home;
      case '/login':
        return NavigationEnums.login;
      case '/onboard':
        return NavigationEnums.onboard;
      case '/noteDetail':
        return NavigationEnums.noteDetail;
      case '/addNote':
        return NavigationEnums.addNote;

      default:
        throw Exception('$val not found in $this');
    }
  }
}
