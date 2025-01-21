import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/group_model/item.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_user_groups_item_header.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/generated/l10n.dart';

class InActiveAllUserGroupsItem extends StatelessWidget {
  const InActiveAllUserGroupsItem({
    super.key,
    required this.itemModel,
  });

  final Item itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AllUserGroupsItemHeader(
            adminName: itemModel.groupAdminName ?? '',
          ),
          const SizedBox(
            height: 34,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              itemModel.groupName ?? '',
              style: AppStyles.styleMedium16(context),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${itemModel.usersCount ?? ''} ${S.of(context).members}',
              style: AppStyles.styleRegular14(context),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${itemModel.filesCount ?? ''} ${S.of(context).files}',
              style: AppStyles.styleSemiBold24(context),
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveAllUserGroupsItem extends StatelessWidget {
  const ActiveAllUserGroupsItem({
    super.key,
    required this.itemModel,
  });

  final Item itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: ShapeDecoration(
        color: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF4DB7F2)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AllUserGroupsItemHeader(
            imageBackground: Colors.white.withOpacity(0.10000000149011612),
            imageColor: Colors.white,
            adminName: itemModel.groupAdminName ?? '',
          ),
          const SizedBox(
            height: 34,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              itemModel.groupName ?? '',
              style: AppStyles.styleMedium16(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${itemModel.usersCount ?? ''} ${S.of(context).members}',
              style: AppStyles.styleRegular14(context).copyWith(
                color: const Color(0xFFFAFAFA),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${itemModel.filesCount ?? ''} ${S.of(context).files}',
              style: AppStyles.styleSemiBold24(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
