import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/presentation/freezed/dashboard_freezed_data_classes.dart';
part 'radio_and_validation_state.dart';

class RadioAndValidationCubit extends Cubit<RadioAndValidationState> {
  RadioAndValidationCubit() : super(RadioAndValidationStateInitial());

  static RadioAndValidationCubit get(context) => BlocProvider.of(context);

  var addFileObject = AddFileObject("");

  String? selectedGroup;
  int? selectedGroupId;

  onChangedRadio(String? value, int? groupId) {
    selectedGroup = value;
    selectedGroupId = groupId;
    emit(OnChangedRadioState());
  }

  setFileName(String fileName) {
    if (_isFileNameValid(fileName)) {
      addFileObject = addFileObject.copyWith(fileName: fileName);
    } else {
      addFileObject = addFileObject.copyWith(fileName: "");
    }
  }

  bool _isFileNameValid(String fileName) {
    if (fileName.length >= 3) {
      emit(FileNameIsValid());
      return true;
    } else {
      emit(FileNameIsInValid());
      return false;
    }
  }
}
