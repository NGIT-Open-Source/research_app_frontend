import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:researchapp/services/data_calls.dart';
import 'package:researchapp/services/exceptions.dart';
part 'view_patients_state.dart';

class ViewPatientsCubit extends Cubit<ViewPatientsState> {
  DataClass dataClass;
  ViewPatientsCubit({required this.dataClass}) : super(ViewPatientsInitial());
  var box = Hive.box("main");

  void getpatients() async {
    emit(ViewPatientsLoad());
    var response;
    String JWT = box.get("jwt");
    String username = box.get("user");
    try {
      print("in vbloc");
      response = await dataClass.getData(JWT);
      var patients = response["patients"];
      var patientsList = patients.keys.toList();
      patientsList.remove("default");
      print(patientsList);
      var cases = response["patients"];
      emit(ViewPatientsSucess(patients: patientsList,cases: cases));
    } on InternetError {
      emit(ViewPatientInternetError());
    } on APIKeyError {
      emit(ViewPatientsServerError());
    } on ServerError {
      emit(ViewPatientsServerError());
    }
  }
}
