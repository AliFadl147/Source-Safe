import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/core/widgets/custom_icon.dart';
import 'package:source_safe_project/core/widgets/strings_manager.dart';

class TitleAndSubTitleSection extends StatelessWidget {
  const TitleAndSubTitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.joinLoyalifyToday,
              style: AppStyles.styleBold29(context),
            ),
            CustomIcon(
              image: Assets.imagesPerson,
              color: AppColors.kPrimaryColor,
              padding: 12.0,
            ),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          AppStrings.unlockRewardsStartEarningNow,
          style: AppStyles.styleMedium18(context).copyWith(
            color: AppColors.sonicSilver,
          ),
        ),
      ],
    );
  }
}
