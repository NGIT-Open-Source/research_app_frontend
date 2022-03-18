import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authstatus_state.dart';

class AuthstatusCubit extends Cubit<AuthstatusState> {
  AuthstatusCubit() : super(AuthstatusInitial());
}
