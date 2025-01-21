part of 'check_in_cubit.dart';

abstract class CheckInState {}

final class CheckInStateInitialState extends CheckInState {}

final class CheckInStateLoadingState extends CheckInState {}

final class CheckInStateFailureState extends CheckInState {
  final String errMessage;

  CheckInStateFailureState(this.errMessage);
}

final class CheckInStateSuccessState extends CheckInState {}

