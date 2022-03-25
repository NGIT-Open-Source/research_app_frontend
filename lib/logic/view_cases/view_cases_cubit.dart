import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_cases_state.dart';

class ViewCasesCubit extends Cubit<ViewCasesState> {
  ViewCasesCubit() : super(ViewCasesInitial());
  String patientname = "";

  void showcases(var cases) {
    var cases_list = cases.keys.toList();

    emit(ViewCasesShow(cases: cases_list, subcases: cases));
  }
}
