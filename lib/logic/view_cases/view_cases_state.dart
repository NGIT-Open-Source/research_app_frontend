part of 'view_cases_cubit.dart';

@immutable
abstract class ViewCasesState {}

class ViewCasesInitial extends ViewCasesState {}

class ViewCasesShow extends ViewCasesState {
  List<String> cases;
  var subcases;
  ViewCasesShow({required this.cases,required this.subcases});
}
