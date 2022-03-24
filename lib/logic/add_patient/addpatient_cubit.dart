import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:researchapp/services/exceptions.dart';
import 'package:researchapp/services/file_upload.dart';

part 'addpatient_state.dart';

class AddpatientCubit extends Cubit<AddpatientState> {
  AddpatientCubit() : super(AddpatientInitial());
  String fileid = "";

  void addpatient(
      String patientname, String label, String description, String FileID) {

      }

  
}
