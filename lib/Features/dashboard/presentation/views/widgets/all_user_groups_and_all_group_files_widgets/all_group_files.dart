import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_background_container.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_group_files_list_view.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_group_files_form.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_group_files_header.dart';

class AllGroupFiles extends StatelessWidget {
  const AllGroupFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AllGroupFilesHeader(),
        AllGroupFilesListView(),
        Divider(
          height: 48,
          color: Color(0xffF1F1F1),
        ),
        AllGroupFilesForm(),
      ],
    ));
  }
}
