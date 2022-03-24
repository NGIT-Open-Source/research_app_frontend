part of 'file_uploadf_cubit.dart';

@immutable
abstract class FileUploadfState {}

class FileUploadfInitial extends FileUploadfState {}

class FileUploadLoad extends FileUploadfState {}

class FileUploadSuccess extends FileUploadfState {
  String id;
  FileUploadSuccess({required this.id});
}

class FileUploadError extends FileUploadfState {}
