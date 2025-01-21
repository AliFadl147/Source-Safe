part of 'check_out_cubit.dart';

abstract class CheckOutState {}

final class CheckOutStateInitialState extends CheckOutState {}

final class CheckOutStateLoadingState extends CheckOutState {}

final class CheckOutStateFailureState extends CheckOutState {
  final String errMessage;

  CheckOutStateFailureState(this.errMessage);
}

final class CheckOutStateSuccessState extends CheckOutState {}

