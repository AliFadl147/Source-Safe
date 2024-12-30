import 'dart:typed_data';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_user_groups_cubit/get_user_groups_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
part 'add_file_state.dart';

class AddFileCubit extends Cubit<AddFileState> {
  AddFileCubit(this.userRepo) : super(AddFileInitialState());

  static AddFileCubit get(context) => BlocProvider.of(context);

  final UserRepo userRepo;

  bool isLoading = false;

  AppPreferences appPreferences = getIt.get<AppPreferences>();

  Future<void> addFile(BuildContext context, String name, int groupId) async {
    isLoading = true;
    emit(AddFileLoadingState());

    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      final file = result.files.first;
      final Uint8List? fileBytes = file.bytes;
      final String fileName = file.name;

      if (fileBytes != null) {
        final userId = await appPreferences.getUserId();
        if (userId != null) {
          final response = await userRepo.uploadFile(
            name: name,
            groupId: groupId,
            userId: userId,
            fileBytes: fileBytes,
            fileName: fileName,
          );

          response.fold(
            (failure) {
              isLoading = false;
              Navigator.pop(context);
              showSnackBar(
                context,
                customSnackBar(
                  title: 'Error',
                  message: failure.errMessage,
                  contentType:
                      ContentType.failure, // Assuming you have this defined
                  color: Colors.red, // Optional
                ),
              );
              emit(AddFileFailureState(failure.errMessage));
            },
            (success) {
              isLoading = false;
              Navigator.pop(context);
              showSnackBar(
                context,
                customSnackBar(
                  title: 'Success',
                  message: success.message!,
                  contentType:
                      ContentType.success, // Assuming you have this defined
                  color: Colors.green, // Optional
                ),
              );
              emit(AddFileSuccessState());
            },
          );
        }
      }
    } else {
      print('No file selected');
    }
  }
}
