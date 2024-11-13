part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {}

final class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState(this.message);
}

final class AddDeviceTokenLoadingState extends AuthState {}

final class AddDeviceTokenSuccessState extends AuthState {}

final class AddDeviceTokenFailureState extends AuthState {
  final String message;

  AddDeviceTokenFailureState(this.message);
}