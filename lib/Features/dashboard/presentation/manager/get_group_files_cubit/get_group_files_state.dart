part of 'get_group_files_cubit.dart';

abstract class GetGroupFilesState {}

class GetGroupFilesInitialState extends GetGroupFilesState {}

final class GetGroupFilesLoading extends GetGroupFilesState {}

final class GetGroupFilesFailure extends GetGroupFilesState {
  final String errMessage;

  GetGroupFilesFailure(this.errMessage);
}

final class GetGroupFilesSuccess extends GetGroupFilesState {
  final FileModel fileModel;

  GetGroupFilesSuccess(this.fileModel);
}
