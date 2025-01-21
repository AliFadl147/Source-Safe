import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/file_repo.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_group_files_cubit/get_group_files_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(this.fileRepo) : super(CheckOutStateInitialState());

  static CheckOutCubit get(context) => BlocProvider.of(context);

  final FileRepo fileRepo;

  bool isLoading = false;

  AppPreferences appPreferences = getIt.get<AppPreferences>();

  int? _findValueInMap(Map<String, int> fileIdMap, String fileName) {
    print("fileIdMap: $fileIdMap ----- fileName: $fileName");
    for (var entry in fileIdMap.entries) {
      if (entry.key == fileName) {
        return entry.value;
      }
    }
    return null;
  }

  Future<void> checkOut(
      {required BuildContext context, required bool edited}) async {
    isLoading = true;
    emit(CheckOutStateLoadingState());
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      final file = result.files.first;
      final Uint8List? fileBytes = file.bytes;
      final String fileName = file.name;

      if (fileBytes != null && fileName.isNotEmpty) {
        final fileId = _findValueInMap(fileIdMap, fileName);
        final userId = await appPreferences.getUserId();
        if (userId != null) {
          print("userId: $userId ----- fileId: $fileId ----- fileName: $fileName ----- edited: $edited");
          var result = await fileRepo.checkOut(
              userId: userId,
              fileId: fileId!,
              fileBytes: fileBytes,
              fileName: fileName,
              edited: edited);
          result.fold((failure) {
            isLoading = false;
            showSnackBar(
              context,
              customSnackBar(
                title: 'Error',
                message: failure.errMessage,
                contentType:
                    ContentType.failure, // Assuming you have this defined
                color: Colors.red, // Optional: add a custom color if needed
              ),
            );
            emit(CheckOutStateFailureState(failure.errMessage));
          }, (data) {
            isLoading = false;
            showSnackBar(
              context,
              customSnackBar(
                title: 'Success',
                message: data.message!,
                contentType:
                    ContentType.success, // Assuming you have this defined
                color: Colors.green, // Optional: add a custom color if needed
              ),
            );
            emit(CheckOutStateSuccessState());
            GetGroupFilesCubit.get(context).getGroupFiles(groupId: groupId);
          });
        }
      }
    }
  }
}
