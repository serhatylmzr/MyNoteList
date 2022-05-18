part of 'setting_cubit.dart';

class SettingState extends Equatable {
  const SettingState({
    required this.darkMode,
    this.isLoading = false,
    this.currentIndex = 0,
    this.locale,
  });
  final bool darkMode;
  final Locale? locale;
  final bool isLoading;
  final int currentIndex;

  @override
  List<Object?> get props => [darkMode, locale, isLoading, currentIndex];

  SettingState copyWith(
      {bool? darkMode,
      Locale? locale,
      ThemeData? currentTheme,
      bool? isLoading,
      int? currentIndex}) {
    return SettingState(
        darkMode: darkMode ?? this.darkMode,
        locale: locale ?? this.locale,
        isLoading: isLoading ?? this.isLoading,
        currentIndex: currentIndex ?? this.currentIndex);
  }
}
