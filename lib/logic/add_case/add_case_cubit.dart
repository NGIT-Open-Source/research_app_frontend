import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:researchapp/services/data_calls.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_case_state.dart';

class AddCaseCubit extends Cubit<AddCaseState> {
  DataClass dataClass;
  AddCaseCubit({required this.dataClass}) : super(AddCaseInitial());
  var box = Hive.box("main");
  void addcase(String username, String casename, String description,
      String FileID) async {
    emit(AddCaseLoad());
    String JWT = box.get("jwt");
    bool response = false;
    try {
      response =
          await dataClass.add(username, casename, description, FileID, JWT);
    } catch (e) {
      response = false;
    }
    if (response) {
      emit(AddCaseSucess());
    } else {
      emit(AddCaseFailure());
    }
  }

  void reload() {
    emit(AddCaseInitial());
  }
}
