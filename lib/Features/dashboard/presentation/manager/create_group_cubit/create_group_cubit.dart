import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/presentation/freezed/dashboard_freezed_data_classes.dart';
import 'package:source_safe_project/core/utils/functions.dart';
part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(CreateGroupStateInitial());

  static CreateGroupCubit get(context) => BlocProvider.of(context);

  var createGroupObject = CreateGroupObject("");

  Map<int, bool> checkedUsers = {};

  onChangedCheckBox(bool value, int id) {
    checkedUsers[id] = value;
    if (value && !selectedindexes.contains(id)) {
      selectedindexes.add(id);
    } else if (!value && selectedindexes.contains(id)) {
      checkedUsers.remove(id);
      selectedindexes.remove(id);
    }
    emit(OnChangedCheckBoxState());
  }

  setGroupName(String groupName) {
    if (_isGroupNameValid(groupName)) {
      createGroupObject = createGroupObject.copyWith(groupName: groupName);
    } else {
      createGroupObject = createGroupObject.copyWith(groupName: "");
    }
  }

  bool _isGroupNameValid(String groupName) {
    if (groupName.length >= 3) {
      emit(GroupNameIsValid());
      return true;
    } else {
      emit(GroupNameIsInValid());
      return false;
    }
  }
}
