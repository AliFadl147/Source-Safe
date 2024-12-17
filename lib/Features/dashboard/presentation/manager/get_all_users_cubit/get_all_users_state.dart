part of 'get_all_users_cubit.dart';

abstract class GetAllUsersState {}

class GetAllUsersInitialState extends GetAllUsersState {}

final class GetAllUsersLoading extends GetAllUsersState {}

final class GetAllUsersFailure extends GetAllUsersState {
  final String errMessage;

  GetAllUsersFailure(this.errMessage);
}

final class GetAllUsersSuccess extends GetAllUsersState {
  final UsersModel usersModel;

  GetAllUsersSuccess(this.usersModel);
}
