part of 'add_subcase_cubit.dart';

@immutable
abstract class AddSubcaseState {}

class AddSubcaseInitial extends AddSubcaseState {}

class AddSubcaseLoad extends AddSubcaseState{}

class AddSubcaseSucess extends AddSubcaseState{}

class AddSubCaseFailure extends AddSubcaseState{}