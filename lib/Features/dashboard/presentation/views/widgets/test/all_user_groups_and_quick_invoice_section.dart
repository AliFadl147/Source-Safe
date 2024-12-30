import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/test/all_user_groups.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/test/quick_invoice.dart';

class AllUserGroupsAndQuickInvoiceSection extends StatelessWidget {
  const AllUserGroupsAndQuickInvoiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(width: double.infinity, child: AllUserGroups()),
        SizedBox(
          height: 24,
        ),
        QuickInvoice(),
      ],
    );
  }
}
