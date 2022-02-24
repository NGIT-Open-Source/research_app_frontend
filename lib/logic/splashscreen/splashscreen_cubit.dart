import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  final box = Hive.box("main");

  SplashscreenCubit() : super(SplashscreenInitial()) {
    initialize();
  }

  bool checkjwt(String jwt) {
    return true;
  }

  void initialize() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      //if user exsits then
      //1)Verify the JWT
      // -->1a) if the jwt is expired reroute to login page
      // --> 1b) if cool then proceed
      //2)Get the details from the cached DB and then send the object data to the home screen
      //else if user doesnot exist then re route to login page

      var user = box.get("user");
      if (user != null) {
        var jwt = box.get("jwt");
        if (jwt != null) {
          if (checkjwt(jwt)) {
            //route them to homescreen
          } else {
            //jwt expired (session expired show login/signup)
          }
        } else {
          //no user exist (jwt not found)
        }
      } else {
        //show login/signup (no user exist)
      }
    } else {
      emit(ConnectivityError());
    }
  }
}