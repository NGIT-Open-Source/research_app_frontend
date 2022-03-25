part of 'add_case_cubit.dart';

@immutable
abstract class AddCaseState {}

class AddCaseInitial extends AddCaseState {}

class AddCaseLoad extends AddCaseState {}

class AddCaseSucess extends AddCaseState {}

class AddCaseFailure extends AddCaseState {}
