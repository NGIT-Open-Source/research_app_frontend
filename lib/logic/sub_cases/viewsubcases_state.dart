part of 'viewsubcases_cubit.dart';

@immutable
abstract class ViewsubcasesState {}

class ViewsubcasesInitial extends ViewsubcasesState {}

class ViewSubCasesShow extends ViewsubcasesState {
  List<String> subcases_list;
  var subcases;
  ViewSubCasesShow({required this.subcases_list,required this.subcases});
}
