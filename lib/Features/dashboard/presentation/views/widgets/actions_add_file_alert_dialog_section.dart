import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/add_file_cubit/add_file_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/radio_and_validation_cubit/radio_and_validation_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/widgets/custom_button.dart';
import 'package:source_safe_project/generated/l10n.dart';

class ActionsAddFileAlertDialogSection extends StatelessWidget {
  const ActionsAddFileAlertDialogSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioAndValidationCubit, RadioAndValidationState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                foregroundColor: AppColors.white,
                text: S.of(context).addFile,
                onPressed:
                    (RadioAndValidationCubit.get(context).selectedGroup != null)
                        ? () {
                            AddFileCubit.get(context).addFile(
                                context,
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
}
