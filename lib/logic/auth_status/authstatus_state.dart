part of 'authstatus_cubit.dart';

@immutable
abstract class AuthstatusState {}

class AuthstatusInitial extends AuthstatusState {}

class LoggedIn extends AuthstatusState{}

class LoggedOut extends AuthstatusState {}
