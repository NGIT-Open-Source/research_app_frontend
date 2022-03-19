import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/ui/screens/homescreen.dart';
import 'package:researchapp/ui/screens/loginscreen.dart';
import 'package:researchapp/ui/screens/signupscrren.dart';
import 'package:researchapp/ui/screens/splashscreen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => Home());
      case LOGIN_PAGE:
        return MaterialPageRoute(builder: (_) => Login());
      case SIGNUP_PAGE:
        return MaterialPageRoute(builder: (_) => SignUp());
      default:
        return null;
    }
  }
}