part of 'auth_validation_cubit.dart';

abstract class AuthValidationState {}

final class AuthValidationInitial extends AuthValidationState {}

final class EmailIsValid extends AuthValidationState {}

final class EmailIsInValid extends AuthValidationState {}

final class PasswordIsValid extends AuthValidationState {}

final class PasswordIsInValid extends AuthValidationState {}

final class FirstNameIsValid extends AuthValidationState {}

final class FirstNameIsInValid extends AuthValidationState {}

final class LastNameIsValid extends AuthValidationState {}

final class LastNameIsInValid extends AuthValidationState {}

final class AddressIsValid extends AuthValidationState {}

final class AddressIsInValid extends AuthValidationState {}

final class PhoneNumberIsValid extends AuthValidationState {}

final class PhoneNumberIsInValid extends AuthValidationState {}

final class AllDataLoginIsValid extends AuthValidationState {}

final class AllDataLoginIsInValid extends AuthValidationState {}

final class AllDataRegisterIsValid extends AuthValidationState {}

final class AllDataRegisterIsInValid extends AuthValidationState {}
