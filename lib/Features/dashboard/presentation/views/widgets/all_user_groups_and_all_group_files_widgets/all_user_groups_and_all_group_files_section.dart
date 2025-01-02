import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_user_groups.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_group_files.dart';

class AllUserGroupsAndQuickInvoiceSection extends StatelessWidget {
  const AllUserGroupsAndQuickInvoiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: const Column(
        children: [
          AllUserGroups(),
          SizedBox(
            height: 24,
          ),
          AllGroupFiles(),
        ],
      ),
    );
  }
}
