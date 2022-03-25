part of 'addpatient_cubit.dart';

@immutable
abstract class AddpatientState {}

class AddpatientInitial extends AddpatientState {}

class AddPatientLoad extends AddpatientState{}

class AddPatientError extends AddpatientState{}

class AddPatientSuccess extends AddpatientState{}
