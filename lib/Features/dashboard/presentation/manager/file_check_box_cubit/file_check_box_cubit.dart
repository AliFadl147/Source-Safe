import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/core/utils/functions.dart';
part 'file_check_box_state.dart';

class FileCheckBoxCubit extends Cubit<FileCheckBoxState> {
  FileCheckBoxCubit() : super(FileCheckBoxStateInitialState());

  static FileCheckBoxCubit get(context) => BlocProvider.of(context);

  Map<int, bool> checkedFiles = {};

  onChangedCheckBox(bool value, int id, String fileName) {
    checkedFiles[id] = value;
    fileIdMap[fileName] = id;
    if (value && !filesSelectedindexes.contains(id)) {
      filesSelectedindexes.add(id);
    } else if (!value && filesSelectedindexes.contains(id)) {
      checkedFiles.remove(id);
      fileIdMap.remove(fileName);
      filesSelectedindexes.remove(id);
    }
    emit(OnChangedCheckBoxState());
  }
}
