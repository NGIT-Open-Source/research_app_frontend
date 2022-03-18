import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authstatus_state.dart';

class AuthstatusCubit extends Cubit<AuthstatusState> {
  AuthstatusCubit() : super(AuthstatusInitial());

  void login() {
    emit(LoggedIn());
  }

  void logout() {
    emit(LoggedOut());
  }

  int isLoggedIn() {
    return (state is LoggedIn) ? 1 : 0;
  }
}
