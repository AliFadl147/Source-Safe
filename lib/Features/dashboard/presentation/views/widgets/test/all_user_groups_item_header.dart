import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class AllUserGroupsItemHeader extends StatelessWidget {
  const AllUserGroupsItemHeader(
      {super.key,
      this.imageBackground,
      this.imageColor,
      required this.adminName});
  final String adminName;
  final Color? imageBackground, imageColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: ShapeDecoration(
                color: imageBackground ?? const Color(0xFFFAFAFA),
                shape: const OvalBorder(),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesAdmin,
                  colorFilter: ColorFilter.mode(
                      imageColor ?? const Color(0xff4EB7F2), BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            adminName,
            style: AppStyles.styleMedium16(context).copyWith(
              color:
                  imageColor == null ? const Color(0xFF064061) : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
