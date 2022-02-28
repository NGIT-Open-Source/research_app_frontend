import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'logincubit_state.dart';

class LogincubitCubit extends Cubit<LogincubitState> {
  LogincubitCubit() : super(LogincubitInitial());

  void login(String username, String password) {
    emit(LoginLoad());
    

  }
}
