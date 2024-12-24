part of 'check_box_and_validation_cubit.dart';

abstract class CheckBoxAndValidationState {}

final class CheckBoxAndValidationInitialState extends CheckBoxAndValidationState {}

final class GroupNameIsValid extends CheckBoxAndValidationState {}

final class GroupNameIsInValid extends CheckBoxAndValidationState {}

final class OnChangedCheckBoxState extends CheckBoxAndValidationState {}
