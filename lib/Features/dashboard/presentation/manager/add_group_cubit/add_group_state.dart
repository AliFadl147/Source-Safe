part of 'add_group_cubit.dart';

abstract class AddGroupState {}

final class AddGroupInitialState extends AddGroupState {}

final class AddGroupLoadingState extends AddGroupState {}

final class AddGroupFailureState extends AddGroupState {
  final String errMessage;

  AddGroupFailureState(this.errMessage);
}

final class AddGroupSuccessState extends AddGroupState {}
