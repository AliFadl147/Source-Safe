part of 'get_user_groups_cubit.dart';

abstract class GetUserGroupsState {}

class GetUserGroupsInitialState extends GetUserGroupsState {}

final class GetUserGroupsLoading extends GetUserGroupsState {}

final class GetUserGroupsFailure extends GetUserGroupsState {
  final String errMessage;

  GetUserGroupsFailure(this.errMessage);
}

final class GetUserGroupsSuccess extends GetUserGroupsState {
  final GroupModel groupModel;

  GetUserGroupsSuccess(this.groupModel);
}
