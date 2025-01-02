import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/widgets/custom_button.dart';

class AllGroupFilesForm extends StatelessWidget {
  const AllGroupFilesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            foregroundColor: AppColors.white,
            text: 'A',
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: CustomButton(
            foregroundColor: AppColors.white,
            text: 'A',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
