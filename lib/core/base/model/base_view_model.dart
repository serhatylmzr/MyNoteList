import 'package:flutter/material.dart';

import '../../init/navigation/navigation_manager.dart';

abstract class BaseViewModel {
  void setContext(BuildContext context) {
    this.context = context;
  }

  late BuildContext context;

  NavigationManager navigationManager = NavigationManager.instance;
}
