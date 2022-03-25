import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:researchapp/services/data_calls.dart';
import "package:hive_flutter/hive_flutter.dart";

part 'addpatient_state.dart';

class AddpatientCubit extends Cubit<AddpatientState> {
  DataClass dataClass;
  var box = Hive.box("main");
  AddpatientCubit({required this.dataClass}) : super(AddpatientInitial());
  String fileid = "";

  void addpatient(String patientname, String label, String description,
      String FileID) async {
    emit(AddPatientLoad());
    bool result = false;
    String JWT = box.get("jwt");
    try {
      result = await dataClass.addPatient(
          patientname, label, description, FileID, JWT);
    } catch (e) {
      result = false;
    }
    if (result) {
      emit(AddPatientSuccess());
    } else {
      emit(AddPatientError());
    }
  }

  void reload() {
    emit(AddpatientInitial());
  }
}
