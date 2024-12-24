part of 'add_file_cubit.dart';

abstract class AddFileState {}

final class AddFileInitialState extends AddFileState {}

final class AddFileLoadingState extends AddFileState {}

final class AddFileFailureState extends AddFileState {
  final String errMessage;

  AddFileFailureState(this.errMessage);
}

final class AddFileSuccessState extends AddFileState {}
