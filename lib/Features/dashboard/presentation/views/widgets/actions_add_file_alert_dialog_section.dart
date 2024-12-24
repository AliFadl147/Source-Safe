import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/add_file_cubit/add_file_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/radio_and_validation_cubit/radio_and_validation_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/widgets/custom_button.dart';
import 'package:source_safe_project/core/widgets/custom_text_field_widget.dart';
import 'package:source_safe_project/generated/l10n.dart';

class ActionsAddFileAlertDialogSection extends StatefulWidget {
  const ActionsAddFileAlertDialogSection({
    super.key,
  });

  @override
  State<ActionsAddFileAlertDialogSection> createState() =>
      _ActionsAddFileAlertDialogSectionState();
}

class _ActionsAddFileAlertDialogSectionState
    extends State<ActionsAddFileAlertDialogSection> {
  late TextEditingController _fileNameController;

  bool isFileNameValid = true;

  @override
  void initState() {
    _fileNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RadioAndValidationCubit, RadioAndValidationState>(
      listener: (context, state) {
        if (state is FileNameIsValid) {
          isFileNameValid = true;
        } else if (state is FileNameIsInValid) {
          isFileNameValid = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _fileNameController,
                label: S.of(context).fileName,
                error: (isFileNameValid) ? null : S.of(context).fileNameError,
                onChanged: (value) =>
                    RadioAndValidationCubit.get(context).setFileName(value),
                fillColor: AppColors.white,
                prefixIcon: Icons.description,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                foregroundColor: AppColors.white,
                text: S.of(context).addFile,
                onPressed: (_fileNameController.text.length >= 3 &&
                        RadioAndValidationCubit.get(context).selectedGroup !=
                            null)
                    ? () {
                        AddFileCubit.get(context).addFile(
                            context,
                            _fileNameController.text,
                            RadioAndValidationCubit.get(context)
                                .selectedGroupId!);
                      }
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _fileNameController.dispose();
    super.dispose();
  }
}
