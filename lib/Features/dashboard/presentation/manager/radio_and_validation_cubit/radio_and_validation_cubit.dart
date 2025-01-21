import 'package:flutter_bloc/flutter_bloc.dart';
part 'radio_and_validation_state.dart';

class RadioAndValidationCubit extends Cubit<RadioAndValidationState> {
  RadioAndValidationCubit() : super(RadioAndValidationStateInitial());

  static RadioAndValidationCubit get(context) => BlocProvider.of(context);

  String? selectedGroup;
  int? selectedGroupId;

  onChangedRadio(String? value, int? groupId) {
    selectedGroup = value;
    selectedGroupId = groupId;
    emit(OnChangedRadioState());
  }
}
