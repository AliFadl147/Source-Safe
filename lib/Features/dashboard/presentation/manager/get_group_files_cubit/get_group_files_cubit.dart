import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/models/file_model/file_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/file_repo.dart';
import 'package:source_safe_project/core/utils/functions.dart';
part 'get_group_files_state.dart';

class GetGroupFilesCubit extends Cubit<GetGroupFilesState> {
  GetGroupFilesCubit(this.fileRepo) : super(GetGroupFilesInitialState());

  static GetGroupFilesCubit get(context) => BlocProvider.of(context);

  final FileRepo fileRepo;

  Future<void> getGroupFiles({
    required int groupId,
  }) async {
    emit(GetGroupFilesLoading());
    var result = await fileRepo.getGroupFiles(groupId: groupId);
    result.fold((failure) {
      emit(GetGroupFilesFailure(failure.errMessage));
    }, (data) {
      for (final item in data.items) {
        if (item.isReserved == true && item.fileName != null) {
          fileIdMap[item.fileName!] = item.fileId;
        }
      }
      print(fileIdMap);
      emit(GetGroupFilesSuccess(data));
    });
  }
}
