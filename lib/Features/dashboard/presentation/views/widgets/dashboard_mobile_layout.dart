import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/all_user_groups_and_all_group_files_section.dart';

class DashBoardMobileLayout extends StatelessWidget {
  const DashBoardMobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: AllUserGroupsAndQuickInvoiceSection(),
                  )),
              SizedBox(
                width: 16,
              ),
              // Expanded(
              //     child: Column(
              //   children: [
              //     SizedBox(
              //       height: 40,
              //     ),
              //     SizedBox(
              //       height: 24,
              //     ),
              //     Expanded(child: SizedBox() /*IncomeSection()*/),
              //   ],
              // )),
            ],
          ),
        )
      ],
    );
  }
}
