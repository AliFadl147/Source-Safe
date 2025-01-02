import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_background_container.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_user_groups_header.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_user_groups_items_list_view.dart';

class AllUserGroups extends StatelessWidget {
  const AllUserGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AllUserGroupsHeader(),
          SizedBox(
            height: 16,
          ),
          AllUserGroupsItemsListView(),
        ],
      ),
    );
  }
}
