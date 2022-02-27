import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../theme.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final box = Hive.box("main");
  ThemeCubit() : super(LightTheme()) {
    try {
      var theme = box.get("theme");
      if (theme != null) {
        if (theme == "dark")
          emit(DarkTheme());
        else
          emit(LightTheme());
      }
    } catch (e) {
      print("Error in theme Cubit "+e.toString());
    }
  }

  void changetheme() {
    if (state is LightTheme) {
      box.put("theme", "dark");
      emit(DarkTheme());
    } else {
      box.put("theme", "light");
      emit(LightTheme());
    }

    
  }

String gettheme() {
      if (state is LightTheme)
        return "Light";
      else
        return "Dark";
    }
}
