import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/check_in_cubit/check_in_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/check_out_cubit/check_out_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/core/widgets/custom_button.dart';
import 'package:source_safe_project/generated/l10n.dart';

class AllGroupFilesForm extends StatelessWidget {
  const AllGroupFilesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            foregroundColor: AppColors.kPrimaryColor,
            backgroundColor: AppColors.white,
            text: S.of(context).checkIn,
            style: AppStyles.styleMedium14(context).copyWith(
              color: AppColors.kPrimaryColor,
            ),
            onPressed: () {
              CheckInCubit.get(context).checkIn(context: context);
            },
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: CustomButton(
            foregroundColor: AppColors.white,
            text: S.of(context).checkOut,
            style: AppStyles.styleMedium14(context).copyWith(
              color: AppColors.white,
            ),
            onPressed: () {
              CheckOutCubit.get(context).checkOut(context: context, edited: true);
            },
          ),
        ),
      ],
    );
  }
}
