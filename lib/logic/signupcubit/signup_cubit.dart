import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:researchapp/services/auth_service.dart';
import 'package:researchapp/services/exceptions.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  AuthService authService;

  SignupCubit({required this.authService}) : super(SignupInitial());

  void signup(String username, String password, String email) async {
    emit(SignUpLoad());
    try {
      var response = await authService.signup(username, password, email);
      if (!response["email_exits"]) {
        emit(SignUpSucess());
      }
    } on EmailAlreadyExistsError {
      emit(EmailExists());
    } on APIKeyError {
      emit(SignUpFail());
    }
  }

  void reload() {
    emit(SignupInitial());
  }
}
