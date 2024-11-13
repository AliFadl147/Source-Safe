import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.styleBold18(context).copyWith(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
