import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightTheme(themeData: AppTheme.lightTheme));

  void changetheme() {
    if (state is LightTheme)
      emit(DarkTheme(themeData: AppTheme.darkTheme));
    else
      emit(LightTheme(themeData: AppTheme.lightTheme));
  }

  String gettheme() {
    if (state is LightTheme)
      return "Light";
    else
      return "Dark";
  }
}
