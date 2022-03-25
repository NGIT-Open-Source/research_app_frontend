import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:researchapp/services/data_calls.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'add_subcase_state.dart';

class AddSubcaseCubit extends Cubit<AddSubcaseState> {
  DataClass dataClass;
  AddSubcaseCubit({required this.dataClass}) : super(AddSubcaseInitial());

  var box = Hive.box("main");
  void addcase(String username, String casename, String description,
      String FileID) async {
    emit(AddSubcaseLoad());
    String JWT = box.get("jwt");
    bool response = false;
    try {
      response =
          await dataClass.add(username, casename, description, FileID, JWT);
    } catch (e) {
      response = false;
    }
    if (response) {
      emit(AddSubcaseSucess());
    } else {
      emit(AddSubCaseFailure());
    }
  }

  void reload() {
    emit(AddSubcaseInitial());
  }
}
