part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpLoad extends SignupState {}

class SignUpSucess extends SignupState{}

class EmailExists extends SignupState{}

class SignUpFail extends SignupState{}