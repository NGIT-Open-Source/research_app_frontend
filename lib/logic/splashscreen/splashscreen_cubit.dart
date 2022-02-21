import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  SplashscreenCubit() : super(SplashscreenInitial()) {
    initialize();
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
    } else {
      emit(ConnectivityError());
    }
  }
}
