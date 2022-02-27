part of 'splashscreen_cubit.dart';

@immutable
abstract class SplashscreenState {}
//done
class SplashscreenInitial extends SplashscreenState {}
//done
class ConnectivityError extends SplashscreenState{}

class ShowButtons extends SplashscreenState{}
//done
class ToHome extends SplashscreenState{}
//done
class SessionExpired extends SplashscreenState{}