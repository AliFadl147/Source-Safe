import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/file_repo.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_group_files_cubit/get_group_files_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
part 'check_in_state.dart';

class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit(this.fileRepo) : super(CheckInStateInitialState());

  static CheckInCubit get(context) => BlocProvider.of(context);

  final FileRepo fileRepo;

  bool isLoading = false;

  AppPreferences appPreferences = getIt.get<AppPreferences>();

  Future<void> checkIn({
    required BuildContext context,
  }) async {
    isLoading = true;
    emit(CheckInStateLoadingState());
    final userId = await appPreferences.getUserId();
    if (userId != null) {
      var result =
          await fileRepo.checkIn(userId: userId, fileIds: filesSelectedindexes);
      result.fold((failure) {
        isLoading = false;
        showSnackBar(
          context,
          customSnackBar(
            title: 'Error',
            message: failure.errMessage,
            contentType: ContentType.failure, // Assuming you have this defined
            color: Colors.red, // Optional: add a custom color if needed
          ),
        );
        emit(CheckInStateFailureState(failure.errMessage));
      }, (data) {
        isLoading = false;
        showSnackBar(
          context,
          customSnackBar(
            title: 'Success',
            message: data.message!,
            contentType: ContentType.success, // Assuming you have this defined
            color: Colors.green, // Optional: add a custom color if needed
          ),
        );
        emit(CheckInStateSuccessState());
        GetGroupFilesCubit.get(context).getGroupFiles(groupId: groupId);
      });
    }
  }
}
