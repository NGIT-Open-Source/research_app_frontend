part of 'view_patients_cubit.dart';

@immutable
abstract class ViewPatientsState {}

class ViewPatientsInitial extends ViewPatientsState {}

class ViewPatientInternetError extends ViewPatientsState {}

class ViewPatientsServerError extends ViewPatientsState {}

class ViewPatientsLoad extends ViewPatientsState {}

class ViewPatientsSucess extends ViewPatientsState {
  List<String> patients;
  var cases;
  ViewPatientsSucess({required this.patients,required this.cases});
}
