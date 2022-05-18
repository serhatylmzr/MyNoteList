import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../service/setting_cache_manager.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  bool darkMode;
  SettingCubit(this.darkMode) : super(SettingState(darkMode: darkMode));
  SettingCacheManager cacheManager = SettingCacheManager();

  void changeTheme(bool darkMode) async {
    emit(state.copyWith(
      darkMode: darkMode,
    ));

    await cacheManager.cacheTheme(darkMode);
  }

  void changeLang(Locale locale) async {
    emit(state.copyWith(locale: locale));
  }

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void changeCurrentIndex(int currentIndex) {
    emit(state.copyWith(currentIndex: currentIndex));
  }
}
