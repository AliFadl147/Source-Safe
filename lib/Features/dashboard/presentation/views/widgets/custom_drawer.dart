import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/create_group_and_add_files_and_logout_section.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/language_and_lighting_mode_section.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/user_info_and_dashboard_drawer_item_section.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .7,
      child: Card(
        elevation: 8,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Sharp borders
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: UserInfoAndDashboardDrawerItemSection()),
            SliverToBoxAdapter(child: LanguageAndLightingModeSection()),
            SliverFillRemaining(
              hasScrollBody: false,
              child: CreateGroupAndAddFilesAndLogoutSection(),
            )
          ],
        ),
      ),
    );
  }
}
