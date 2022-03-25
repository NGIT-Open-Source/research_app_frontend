import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'viewsubcases_state.dart';

class ViewsubcasesCubit extends Cubit<ViewsubcasesState> {
  ViewsubcasesCubit() : super(ViewsubcasesInitial());

  void showsubcases(var subcases) {
    var subcases_list = subcases.keys.toList();
    emit(ViewSubCasesShow(subcases_list: subcases_list, subcases: subcases));
  }
}
