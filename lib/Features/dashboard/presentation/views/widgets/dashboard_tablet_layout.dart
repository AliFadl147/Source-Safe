import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_drawer.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/dashboard_mobile_layout.dart';

class DashBoardTabletLayout extends StatelessWidget {
  const DashBoardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomDrawer()),
        SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: DashBoardMobileLayout(),
            )),
      ],
    );
  }
}
