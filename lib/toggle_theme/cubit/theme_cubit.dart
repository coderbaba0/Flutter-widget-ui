import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_source/main.dart';

import '../app_themes.dart';

enum AppTheme { light, dark }

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.light) {
    _loadSavedTheme();
  }

  void _loadSavedTheme() {
    AppTheme savedTheme = (preferences.getString('theme') ?? 'light') == 'light'
        ? AppTheme.light
        : AppTheme.dark;
    emit(savedTheme);
  }

  void toggleTheme() {
    AppTheme newTheme = state == AppTheme.light ? AppTheme.dark : AppTheme.light;
    emit(newTheme);
    preferences.setString('theme', newTheme == AppTheme.light ? 'light' : 'dark');
  }

  ThemeData get currentTheme =>
      state == AppTheme.light ? AppThemes.lightTheme : AppThemes.darkTheme;
}
