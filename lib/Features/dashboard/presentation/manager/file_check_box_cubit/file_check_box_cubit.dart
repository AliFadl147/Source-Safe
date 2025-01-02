import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/core/utils/functions.dart';
part 'file_check_box_state.dart';

class FileCheckBoxCubit extends Cubit<FileCheckBoxState> {
  FileCheckBoxCubit() : super(FileCheckBoxStateInitialState());

  static FileCheckBoxCubit get(context) => BlocProvider.of(context);

  Map<int, bool> checkedUsers = {};

  onChangedCheckBox(bool value, int id) {
    checkedUsers[id] = value;
    if (value && !filesSelectedindexes.contains(id)) {
      filesSelectedindexes.add(id);
    } else if (!value && filesSelectedindexes.contains(id)) {
      checkedUsers.remove(id);
      filesSelectedindexes.remove(id);
    }
    emit(OnChangedCheckBoxState());
  }
}
