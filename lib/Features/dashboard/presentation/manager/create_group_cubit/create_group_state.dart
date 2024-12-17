part of 'create_group_cubit.dart';

abstract class CreateGroupState {}

final class CreateGroupStateInitial extends CreateGroupState {}

final class GroupNameIsValid extends CreateGroupState {}

final class GroupNameIsInValid extends CreateGroupState {}

final class OnChangedCheckBoxState extends CreateGroupState {}
