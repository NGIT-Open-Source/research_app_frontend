import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:researchapp/services/auth_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:researchapp/services/exceptions.dart';

part 'logincubit_state.dart';

class LogincubitCubit extends Cubit<LogincubitState> {
  AuthService authService;
  final box = Hive.box("main");
  LogincubitCubit({required this.authService}) : super(LogincubitInitial());

  void login(String username, String password) async {
    emit(LoginLoad());

    try {
      Map<String, dynamic> response =
          await authService.login(username, password);
      if (response["login"]) {
        box.put("jwt", response["token"]);
        box.put("user", username);
      }
      emit(LoginSuccess(name: username));
    } on PasswordError {
      emit(PasswordErrorState());
    } on UserNotFoundError {
      emit(UserNotFound());
    } on APIKeyError {
      emit(LoginError());
    }
  }

  void reload() {
    emit(LogincubitInitial());
  }
}
