part of 'radio_and_validation_cubit.dart';

abstract class RadioAndValidationState {}

final class RadioAndValidationStateInitial extends RadioAndValidationState {}

final class FileNameIsValid extends RadioAndValidationState {}

final class FileNameIsInValid extends RadioAndValidationState {}

final class OnChangedRadioState extends RadioAndValidationState {}
