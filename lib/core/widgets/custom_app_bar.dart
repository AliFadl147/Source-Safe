import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.backgroundColor,
    this.svgPicture,
    this.onTap,
    this.isTitle,
    this.isActions,
    this.title,
    this.icon,
    this.currentIndex = -1,
    this.actionsOnTap,
  });

  final bool? isTitle;
  final bool? isActions;
  final String? title;
  final String? icon;
  final Color backgroundColor;
  final CustomIcon? svgPicture;
  final GestureTapCallback? onTap;
  final int currentIndex;
  final GestureTapCallback? actionsOnTap;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0,
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: svgPicture != null
          ? InkWell(
              onTap: onTap,
              child: Center(
                child: svgPicture,
              ),
            )
          : null,
      title: isTitle != null
          ? Align(
              alignment: Alignment.center,
              child: Text(
                title!,
                style: currentIndex == 0
                    ? AppStyles.styleBold29(context).copyWith(
                        color: AppColors.white,
                      )
                    : AppStyles.styleBold29(context),
              ),
            )
          : null,
      actions: isActions != null
          ? [
              GestureDetector(
                onTap: actionsOnTap,
                child: CustomIcon(
                  image: icon!,
                  color: currentIndex == 0 ? AppColors.white : AppColors.black,
                  padding: 12.0, width: null,
                ),
              )
            ]
          : null,
    );
  }
}
