import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/core/widgets/custom_icon.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            style: AppStyles.styleBold18(context).copyWith(
              color: AppColors.deepCharcoal,
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        CustomIcon(
          image: Assets.imagesPerson,
          color: AppColors.kPrimaryColor,
          padding: 0,
          width: 40,
        ),
      ],
    );
  }
}
