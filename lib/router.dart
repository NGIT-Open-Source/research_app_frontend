import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/ui/screens/splashscreen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder:(_)=> const SplashScreen());
      default:
        return null;
    }
  }
}
