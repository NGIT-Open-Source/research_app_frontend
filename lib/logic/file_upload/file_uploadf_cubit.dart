import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../services/file_upload.dart';

part 'file_uploadf_state.dart';

class FileUploadfCubit extends Cubit<FileUploadfState> {
  FileUploader fileUploader;

  FileUploadfCubit({required this.fileUploader}) : super(FileUploadfInitial());

  Future<String> fileupload(File file) async {
    emit(FileUploadLoad());
    var response;
    try {
      response = await fileUploader.FileUpload(file);
    } on Exception {
      emit(FileUploadError());
    }

    var fileid = response["file_id"];

    emit(FileUploadSuccess(id: fileid));
    return fileid;
  }

  void reload() {
    emit(FileUploadfInitial());
  }
}
