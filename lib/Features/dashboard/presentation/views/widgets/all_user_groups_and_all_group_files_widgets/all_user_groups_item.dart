import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/group_model/item.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/inactive_and_active_all_user_groups_item.dart';

class AllUserGroupsItem extends StatelessWidget {
  const AllUserGroupsItem(
      {super.key, required this.itemModel, required this.isSelected});

  final Item itemModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveAllUserGroupsItem(itemModel: itemModel)
        : InActiveAllUserGroupsItem(itemModel: itemModel);
  }
}
