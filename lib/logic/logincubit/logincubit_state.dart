part of 'logincubit_cubit.dart';

@immutable
abstract class LogincubitState {}

class LogincubitInitial extends LogincubitState {}

class LoginLoad extends LogincubitState{}

class LoginSuccess extends LogincubitState{}

class PasswordError extends LogincubitState {}

class UserNotFound extends LogincubitState{}

class LoginError extends LogincubitState {}

