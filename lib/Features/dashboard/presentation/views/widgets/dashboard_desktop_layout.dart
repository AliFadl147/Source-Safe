import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_drawer.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_user_groups_and_all_group_files_section.dart';

class DashboardDesktopLayout extends StatelessWidget {
  const DashboardDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: CustomDrawer()),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 3,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: AllUserGroupsAndQuickInvoiceSection(),
                        )),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(), //MyCardsAndTransctionHistorySection(),
                        SizedBox(
                          height: 24,
                        ),
                        Expanded(child: SizedBox() /*IncomeSection()*/),
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
